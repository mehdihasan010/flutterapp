import 'package:bloc/bloc.dart';
import 'package:bloc_ecommerce/src/data/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;

  LoginBloc(this.repository) : super(LoginInitial()) {
    on<RequestGoogleLogin>((event, emit) async {
      try {
        emit(LoginLoading());
        final user = await repository.signInWithGoogle();
        debugPrint("User:${user?.email}");
        if (user?.email != null) {
          emit(WelcomeLoginSuccess());
        } else {
          emit(LoginFailed(massage: "login failed"));
        }
      } catch (e) {
        debugPrint(e.toString());
        emit(LoginFailed(massage: e.toString()));
      }
    });

    on<RequestFacebookLogin>((event, emit) async {
      try {
        emit(LoginLoading());
        final user = await repository.signInWithFacebook();
        debugPrint("User:${user?.email}");
        if (user?.email != null) {
          emit(LoginSuccess());
        } else {
          emit(LoginFailed(massage: "login failed"));
        }
      } catch (e) {
        debugPrint(e.toString());
        emit(LoginFailed(massage: e.toString()));
      }
    });

    on<RequestEmailLogin>((event, emit) async {
      try {
        emit(LoginLoading());
        await repository
            .signInWithEmail(event.email, event.password)
            .then((value) => emit(LoginSuccess()));
        emit(LoginInitial());
      } catch (e) {
        emit(LoginFailed(massage: e.toString()));
      }
    });
  }
}
