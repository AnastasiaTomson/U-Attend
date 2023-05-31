part of 'qr_lesson_bloc.dart';

@immutable
abstract class QrLessonState {}

class QrLessonInitial extends QrLessonState {}

class LessonNotReceived extends QrLessonState {}

class QrLessonReceived extends QrLessonState {
  final Lesson? lesson;

  QrLessonReceived(this.lesson);
}
