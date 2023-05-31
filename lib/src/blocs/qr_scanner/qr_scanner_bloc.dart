import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:u_attend/src/locator.dart';
import 'package:u_attend/src/services/lesson_service.dart';

part 'qr_scanner_event.dart';

part 'qr_scanner_state.dart';

class QrScannerBloc extends Bloc<QRScannerEvent, QRScannerState> {
  LessonService lessonService = locator<LessonService>();

  QrScannerBloc() : super(QrScannerInitial()) {
    on<ScanQR>((event, emit) async {
      Map<String, dynamic> response_map =
          await lessonService.scanQR(event.lesson_id);
      response_map['status']
          ? emit(
              QrScannerSuccess(response_map['status'], response_map['message']))
          : emit(
              QrScannerError(response_map['status'], response_map['message']));
    });
  }
}
