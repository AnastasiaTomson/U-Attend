import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:u_attend/src/locator.dart';
import 'package:u_attend/src/services/auth_service.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthService authService = locator<AuthService>();

  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<Authenticate>((event, emit) async {
      bool success = await authService.authenticate(
          event.login, event.password, event.isStaff);
      success ? emit(Authenticated()) : emit(UnAuthenticated());
    });
    on<Logout>((event, emit) {
      bool success = authService.logout();
      success ? emit(UnAuthenticated()) : emit(Authenticated());
    });
  }
}
