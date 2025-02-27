part of 'qr_bloc.dart';

abstract class QrEvent {}

class QRDataFetchEvent extends QrEvent {
  String number;

  QRDataFetchEvent({required this.number});
}
