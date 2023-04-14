part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class Authenticate extends AuthenticationEvent {
  final String login;
  final String password;
  final bool isStaff;

  Authenticate(this.login, this.password, this.isStaff);
}

class Logout extends AuthenticationEvent {}
