part of 'qr_bloc.dart';

abstract class QrState {}

class QrInitialState extends QrState {}

class QrLoadingState extends QrState {}

class QrLoadedState extends QrState {
  final UserDetails user;

  QrLoadedState({required this.user});
}

class QrErrorState extends QrState {
  final ErrorModel error;

  QrErrorState({required this.error});
}
