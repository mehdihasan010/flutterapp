import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repository/auth_repository.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRepository repository;
  LogoutBloc(this.repository) : super(LogoutInitial()) {
    on<RequestSignOut>((event, emit) async {
      try {
        await repository.signoutUser().then((value) => emit(LogOutSuccess()));
      } catch (e) {
        emit(LogOutFailed(massage: e.toString()));
      }
    });
  }
}
