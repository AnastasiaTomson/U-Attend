part of 'qr_lesson_bloc.dart';

@immutable
abstract class QrLessonEvent {}

class CreateQR extends QrLessonEvent {
  final Lesson lesson;

  CreateQR(this.lesson);
}
