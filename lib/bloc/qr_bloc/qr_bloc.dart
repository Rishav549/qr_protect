library qr_bloc;

import 'package:bloc/bloc.dart';
import 'package:qr_protect/models/error.dart';
import 'package:qr_protect/models/userDetails.dart';
import 'package:qr_protect/repo/details/details.dart';
import 'package:qr_protect/utilities/logger.dart';

part 'qr_event.dart';

part 'qr_state.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  QrBloc() : super(QrInitialState()) {
    on<QRDataFetchEvent>(_fetch);
  }

  Future<void> _fetch(QRDataFetchEvent event, emit) async {
    emit(QrLoadingState());
    try {
      UserDetails? user = await detailsFetch(event.number);
      emit(QrLoadedState(user: user!));
    } catch (e) {
      CustomLogger.error(e);
      emit(QrErrorState(
          error: ErrorModel(message: "Failed to Fetch Info", e: e)));
    }
  }
}
