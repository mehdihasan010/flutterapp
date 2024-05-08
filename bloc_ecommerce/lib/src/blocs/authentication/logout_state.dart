part of 'logout_bloc.dart';

sealed class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object> get props => [];
}

final class LogoutInitial extends LogoutState {}

class LogOutSuccess extends LogoutState {}

class LogOutFailed extends LogoutState {
  final String massage;

  const LogOutFailed({required this.massage});

  @override
  List<Object> get props => [massage];
}
