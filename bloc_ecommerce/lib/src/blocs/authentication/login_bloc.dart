import 'package:bloc/bloc.dart';
import 'package:bloc_ecommerce/src/data/repository/auth_repository.dart';
import 'package:flutter/foundation.dart';
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
        emit(LoginSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(LoginFailed(e.toString()));
      }
    });

    on<RequestFacebookLogin>((event, emit) async {
      try {
        emit(LoginLoading());
        final user = await repository.signInWithFacebook();
        debugPrint("User:${user?.email}");
        emit(LoginSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(LoginFailed(e.toString()));
      }
    });
  }
}
