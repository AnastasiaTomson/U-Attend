part of 'lesson_visit_bloc.dart';

@immutable
abstract class LessonVisitEvent {}

class GetLessonVisit extends LessonVisitEvent {
  final Lesson lesson;

  GetLessonVisit(this.lesson);
}