part of 'remember_switch_cubit.dart';

abstract class RememberSwitchState {}

class RememberSwitchInitial extends RememberSwitchState {}

class SwitchChange extends RememberSwitchState {
  final bool value;

  SwitchChange(this.value);
}
