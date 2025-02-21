library details_bloc;

import 'package:bloc/bloc.dart';
import 'package:qr_protect/models/error.dart';
import 'package:qr_protect/models/userDetails.dart';
import 'package:qr_protect/repo/details/details.dart';
import 'package:qr_protect/utilities/logger.dart';

part 'details_event.dart';

part 'details_states.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsStates> {
  DetailsBloc() : super(DetailsInitialState()) {
    on<DetailsPostEvent>(_fetch);
  }

  Future<void> _fetch(DetailsPostEvent event, emit) async {
    emit(DetailsLoadingState());
    try {
      await detailsAdd(event.data);
      emit(DetailsLoadedState());
    } catch (e) {
      CustomLogger.error(e);
      emit(DetailsErrorState(
          error: ErrorModel(message: "Error Posting Data", e: e)));
    }
  }
}
