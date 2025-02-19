library authentication_bloc;

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/error.dart';
import '../../repo/auth/authentication.dart';
import '../../utilities/logger.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationLoadingState()) {
    on<AuthenticationLoggedInEvent>(_authLogged);
    on<AuthenticationLogInEvent>(_authLogin);
    on<AuthenticationCheckUserEvent>(_authCheck);
    on<AuthenticationLogOutEvent>(_authLogout);
  }

  Future<void> _authLogged(AuthenticationLoggedInEvent event, emit) async {
    emit(AuthenticationLoadingState());
    try {
      if (await checkLoggedIn()) {
        emit(AuthenticationLoggedInState());
      }
      else {
        emit(AuthenticationLoggedOutState());
      }
    } catch (e) {
      CustomLogger.error(e);
    }
  }

  Future<void> _authLogin(AuthenticationLogInEvent event, emit) async {
    emit(AuthenticationLoadingState());
    try {
      UserCredential? userCredentials =
          await signInWithEmailAndPassword(event.email, event.password);
      User user = userCredentials!.user!;
      String uid = user.uid;
      if (userCredentials != null) {
        emit(AuthenticationLoggedInState(uid: uid));
      } else {
        emit(AuthenticationLoggedOutState());
      }
    } catch (e) {
      CustomLogger.error(e);
      emit(AuthenticationErrorState(
          error: ErrorModel(
              message: "Failed to Login, Please Check Your Credentials",
              e: e)));
    }
  }

  Future<void> _authCheck(AuthenticationCheckUserEvent event, emit) async {
    try {
      UserCredential? userCredential =
          await addUser(event.email, event.password);
      User user = userCredential!.user!;
      String uid = user.uid;
      if (userCredential != null) {
        emit(AuthenticationLoggedInState(uid: uid));
      } else {
        emit(AuthenticationLoggedOutState());
      }
    } catch (e) {
      CustomLogger.error(e);
    }
  }

  Future<void> _authLogout(AuthenticationLogOutEvent event, emit) async {
    //await logOutUser();
    emit(AuthenticationLoggedOutState());
  }
}
