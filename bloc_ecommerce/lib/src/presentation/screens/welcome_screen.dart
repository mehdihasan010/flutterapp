import 'package:bloc_ecommerce/src/blocs/blocs.dart';
import 'package:bloc_ecommerce/src/presentation/widgets/widgets.dart';
import 'package:bloc_ecommerce/src/routes/route_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Let's Get Started",
              style: Theme.of(context).textTheme.titleLarge),
          BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is LoginLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SocialLoginButton(
                        buttonType: SocialLoginButtonType.google,
                        onPressed: () => context
                            .read<LoginBloc>()
                            .add(RequestGoogleLogin())),
                    const Gap(20),
                    SocialLoginButton(
                        buttonType: SocialLoginButtonType.facebook,
                        onPressed: () => context
                            .read<LoginBloc>()
                            .add(RequestFacebookLogin())),
                    const Gap(20),
                    SocialLoginButton(
                        buttonType: SocialLoginButtonType.twitter,
                        onPressed: () {}),
                    const Gap(20),
                  ],
                ),
              );
            },
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  InkWell(
                    onTap: () => context.pushNamed(Routes.LOGIN_ROUTE),
                    child: Text(
                      'Signin',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ),
                ],
              ),
              const Gap(10),
              FullWidthButton(
                buttonName: 'Create An Account',
                onTap: () => context.pushNamed(Routes.REGISTER_ROUTE),
              )
            ],
          )
        ],
      ),
    );
  }
}
