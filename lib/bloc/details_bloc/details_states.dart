part of 'details_bloc.dart';

abstract class DetailsStates {}

class DetailsInitialState extends DetailsStates {}

class DetailsLoadingState extends DetailsStates {}

class DetailsLoadedState extends DetailsStates {}

class DetailsErrorState extends DetailsStates {
  final ErrorModel error;

  DetailsErrorState({required this.error});
}
