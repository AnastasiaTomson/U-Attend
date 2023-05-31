import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:u_attend/src/locator.dart';
import 'package:u_attend/src/models/Lesson.dart';
import 'package:u_attend/src/services/lesson_service.dart';

part 'qr_lesson_event.dart';
part 'qr_lesson_state.dart';

class QrLessonBloc extends Bloc<QrLessonEvent, QrLessonState> {
  LessonService lessonService = locator<LessonService>();

  QrLessonBloc() : super(QrLessonInitial()) {
    on<CreateQR>((event, emit) async {
      Lesson? lesson = await lessonService.createQR(event.lesson);
      emit(QrLessonReceived(lesson));
    });
  }
}