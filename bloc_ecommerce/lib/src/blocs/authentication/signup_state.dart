part of 'signup_bloc.dart';

@immutable
abstract class SignupState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpLoading extends SignupState {}

class SignupInitial extends SignupState {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  List<Object?> get props =>
      [usernameController, emailController, passwordController];
}

class SignUpSuccess extends SignupState {}

class SignUpFailed extends SignupState {
  final String massage;

  SignUpFailed({required this.massage});

  @override
  List<Object?> get props => [massage];
}
