part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class Authenticated extends AuthenticationState {}

class UnAuthenticated extends AuthenticationState {}
