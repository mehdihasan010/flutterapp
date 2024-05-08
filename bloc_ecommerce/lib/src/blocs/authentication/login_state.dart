part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  List<Object?> get props => [emailController, passwordController];
}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class WelcomeLoginSuccess extends LoginState {}

class LoginFailed extends LoginState {
  final String massage;

  LoginFailed({required this.massage});

  @override
  List<Object?> get props => [massage];
}
