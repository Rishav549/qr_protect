part of 'authentication_bloc.dart';

abstract class AuthenticationState {}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationLoggedInState extends AuthenticationState {
  String uid;

  AuthenticationLoggedInState({this.uid = ""});
}

class AuthenticationLoggedOutState extends AuthenticationState {}

class AuthenticationErrorState extends AuthenticationState {
  ErrorModel error;

  AuthenticationErrorState({required this.error});
}
