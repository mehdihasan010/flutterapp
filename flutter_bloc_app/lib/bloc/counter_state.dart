part of 'counter_bloc.dart';

abstract class CounterState {
  int count;
  CounterState(this.count);
}

class CounterInitial extends CounterState {
  CounterInitial(super.count);
}

class NumberIncreament extends CounterState {
  NumberIncreament(super.count);
}

class NumberDecreament extends CounterState {
  NumberDecreament(super.count);
}
