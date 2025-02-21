part of 'details_bloc.dart';

abstract class DetailsEvent {}

class DetailsPostEvent extends DetailsEvent {
  final UserDetails data;

  DetailsPostEvent({required this.data});
}
