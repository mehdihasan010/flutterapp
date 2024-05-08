import 'package:bloc/bloc.dart';
import 'package:bloc_ecommerce/src/data/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  AuthRepository repository;
  SignupBloc(this.repository) : super(SignupInitial()) {
    on<RequestEmailSignUp>((event, emit) async {
      emit(SignUpLoading());
      try {
        await repository
            .signUpWithEmail(event.username, event.email, event.password)
            .then((value) => emit(SignUpSuccess()));

        emit(SignupInitial());
      } catch (e) {
        emit(SignUpFailed(massage: e.toString()));
      }
    });
  }
}
