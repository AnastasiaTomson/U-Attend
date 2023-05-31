part of 'qr_scanner_bloc.dart';

@immutable
abstract class QRScannerEvent {}

class ScanQR extends QRScannerEvent{
  final int? lesson_id;

  ScanQR(this.lesson_id);
}