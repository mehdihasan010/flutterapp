import 'package:bloc_ecommerce/src/blocs/blocs.dart';
import 'package:bloc_ecommerce/src/presentation/widgets/widgets.dart';
import 'package:bloc_ecommerce/src/routes/route_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Sign Up",
              style: theme.textTheme.headlineLarge,
            ),
            const Gap(50),
            BlocConsumer<SignupBloc, SignupState>(
              listener: (context, state) {
                if (state is SignUpSuccess) {
                  Fluttertoast.showToast(msg: "SignUp Success");
                  Future.delayed(const Duration(seconds: 1), () {
                    context.goNamed(Routes.HOME_ROUTE);
                  });
                }
                if (state is SignUpFailed) {
                  Fluttertoast.showToast(msg: state.massage);
                }
              },
              builder: (context, state) {
                if (state is SignupInitial) {
                  return Form(
                    key: formkey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: state.usernameController,
                          decoration: InputDecoration(
                              label: const Text('Username'),
                              labelStyle: theme.textTheme.labelLarge?.copyWith(
                                  color: theme.colorScheme.outlineVariant)),
                          validator: (value) {
                            if (value == '' || value == null) {
                              return 'Username is required';
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                          controller: state.emailController,
                          decoration: InputDecoration(
                              label: const Text('Email Address'),
                              labelStyle: theme.textTheme.labelLarge?.copyWith(
                                  color: theme.colorScheme.outlineVariant)),
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
                              labelStyle: theme.textTheme.labelLarge?.copyWith(
                                  color: theme.colorScheme.outlineVariant)),
                          validator: (value) {
                            if (value == '' || value == null) {
                              return 'Password is required';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: LoadingAnimationWidget.twoRotatingArc(
                        color: theme.colorScheme.onPrimaryContainer,
                        size: 100.w),
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              TextButton(
                  onPressed: () => context.pushNamed(Routes.LOGIN_ROUTE),
                  child: Text(
                    "Sign In",
                    style: Theme.of(context).textTheme.labelMedium,
                  ))
            ],
          ),
          BlocBuilder<SignupBloc, SignupState>(
            builder: (context, state) {
              return FullWidthButton(
                buttonName: 'Sign Up',
                buttonChild: state is SignUpLoading
                    ? LoadingAnimationWidget.discreteCircle(
                        color: theme.colorScheme.onPrimaryContainer, size: 35.w)
                    : null,
                onTap: () {
                  if (state is SignupInitial) {
                    if (formkey.currentState!.validate()) {
                      context.read<SignupBloc>().add(RequestEmailSignUp(
                          username: state.usernameController.text,
                          email: state.emailController.text,
                          password: state.passwordController.text));
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
