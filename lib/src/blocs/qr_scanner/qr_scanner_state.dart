part of 'qr_scanner_bloc.dart';

@immutable
abstract class QRScannerState {}

class QrScannerInitial extends QRScannerState {}

class QrScannerSuccess extends QRScannerState {
  final bool status;
  final String message;

  QrScannerSuccess(this.status, this.message);
}

class QrScannerError extends QRScannerState {
  final bool status;
  final String message;

  QrScannerError(this.status, this.message);
}
