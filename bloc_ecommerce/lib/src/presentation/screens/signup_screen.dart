import 'package:bloc_ecommerce/src/blocs/blocs.dart';
import 'package:bloc_ecommerce/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
              "Sign Up",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const Gap(50),
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
            TextField(
              decoration: InputDecoration(
                  label: const Text('Email Address'),
                  labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.outlineVariant)),
            ),
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
            )
          ],
        ),
      ),
      bottomNavigationBar: const FullWidthButton(
        buttonName: 'Sign Up',
      ),
    );
  }
}
