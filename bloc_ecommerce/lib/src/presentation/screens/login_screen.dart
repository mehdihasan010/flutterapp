import 'package:bloc_ecommerce/src/blocs/blocs.dart';
import 'package:bloc_ecommerce/src/routes/route_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome", style: Theme.of(context).textTheme.headlineLarge),
            Text(
              "Please enter your data to continue",
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.outlineVariant),
            ),
            const Gap(100),
            BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Fluttertoast.showToast(msg: "Login Success");
                  Future.delayed(const Duration(seconds: 1), () {
                    context.goNamed(Routes.HOME_ROUTE);
                  });
                }
                if (state is LoginFailed) {
                  Fluttertoast.showToast(msg: state.massage);
                }
              },
              builder: (context, state) {
                if (state is LoginInitial) {
                  return Column(
                    children: [
                      Form(
                          key: formkey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                controller: state.emailController,
                                decoration: InputDecoration(
                                    label: const Text('Email'),
                                    labelStyle: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .outlineVariant)),
                                validator: (value) {
                                  if (value == '' || value == null) {
                                    return 'Email is required';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              TextFormField(
                                controller: state.passwordController,
                                decoration: InputDecoration(
                                    label: const Text('Password'),
                                    labelStyle: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .outlineVariant)),
                                validator: (value) {
                                  if (value == '' || value == null) {
                                    return 'Password is required';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ],
                          )),
                      const Gap(40),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot password?',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    color: Theme.of(context).colorScheme.error),
                          )),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Remember Me',
                              style: Theme.of(context).textTheme.labelLarge),
                          BlocBuilder<RememberSwitchCubit, RememberSwitchState>(
                            builder: (context, state) {
                              return Switch(
                                  value: state is SwitchChange
                                      ? state.value
                                      : true,
                                  onChanged: (value) => context
                                      .read<RememberSwitchCubit>()
                                      .switchToggle(value));
                            },
                          )
                        ],
                      ),
                    ],
                  );
                } else {
                  return Center(
                      child: LoadingAnimationWidget.twoRotatingArc(
                          color: theme.colorScheme.onPrimaryContainer,
                          size: 100.w));
                }
              },
            ),

            //const Gap(50),
            // Text(
            //   'By connecting your account confirm that you agree with our Term and Condition',
            //   style: Theme.of(context).textTheme.labelMedium,
            // )
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account? ",
                  style: Theme.of(context).textTheme.labelMedium),
              TextButton(
                  onPressed: () => context.pushNamed(Routes.REGISTER_ROUTE),
                  child: Text("Sign Up",
                      style: Theme.of(context).textTheme.labelMedium))
            ],
          ),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return FullWidthButton(
                buttonName: 'Login',
                buttonChild: state is LoginLoading
                    ? LoadingAnimationWidget.discreteCircle(
                        color: theme.colorScheme.onPrimaryContainer, size: 35.w)
                    : null,
                onTap: () {
                  if (state is LoginInitial) {
                    if (formkey.currentState!.validate()) {
                      context.read<LoginBloc>().add(RequestEmailLogin(
                          email: state.emailController.text,
                          password: state.passwordController.text,
                          isRemember: RememberSwitchCubit.isRemember));
                    }
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
