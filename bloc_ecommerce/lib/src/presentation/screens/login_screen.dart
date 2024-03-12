import 'package:bloc_ecommerce/src/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              "Please enter your data to continue",
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.outlineVariant),
            ),
            const Gap(100),
            TextField(
              decoration: InputDecoration(
                  label: const Text('Username'),
                  labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.outlineVariant)),
            ),
            TextField(
              decoration: InputDecoration(
                  label: const Text('Password'),
                  labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.outlineVariant)),
            ),
            const Gap(40),
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot password?',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: Theme.of(context).colorScheme.error),
                )),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Remember Me',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                BlocBuilder<RememberSwitchCubit, RememberSwitchState>(
                  builder: (context, state) {
                    return Switch(
                        value: state is SwitchChange ? state.value : true,
                        onChanged: (value) => context
                            .read<RememberSwitchCubit>()
                            .switchToggle(value));
                  },
                )
              ],
            ),
            const Gap(50),
            Text(
              'By connecting your account confirm that you agree with our Term and Condition',
              style: Theme.of(context).textTheme.labelMedium,
            )
          ],
        ),
      ),
      bottomNavigationBar: const FullWidthButton(
        buttonName: 'Login',
      ),
    );
  }
}
