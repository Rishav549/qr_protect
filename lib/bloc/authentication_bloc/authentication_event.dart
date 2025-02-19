part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {}

class AuthenticationLoggedInEvent extends AuthenticationEvent {}

class AuthenticationLogInEvent extends AuthenticationEvent {
  String email, password;

  AuthenticationLogInEvent({required this.email, required this.password});
}

class AuthenticationLogOutEvent extends AuthenticationEvent {}

class AuthenticationCheckUserEvent extends AuthenticationEvent {
  final String email, password;

  AuthenticationCheckUserEvent({required this.email, required this.password});
}
