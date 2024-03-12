import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/counter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Counter App"),
        ),
        body: Center(
          child:
              BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
            return Text(
              state.count.toString(),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            );
          }),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () => context.read<CounterBloc>().add(Increament()),
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 20,
            ),
            FloatingActionButton(
              onPressed: () => context.read<CounterBloc>().add(Decreament()),
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
