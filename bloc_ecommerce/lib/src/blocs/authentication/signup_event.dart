part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RequestEmailSignUp extends SignupEvent {
  final String username;
  final String email;
  final String password;

  RequestEmailSignUp(
      {required this.username, required this.email, required this.password});

  @override
  List<Object?> get props => [username, email, password];
}
