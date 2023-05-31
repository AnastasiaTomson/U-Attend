part of 'change_lesson_visit_bloc.dart';

@immutable
abstract class ChangeLessonVisitEvent {}

class ChangeLessonVisit extends ChangeLessonVisitEvent {
  final Lesson lesson;
  final List<String> students_id;

  ChangeLessonVisit(this.lesson, this.students_id);
}

class GetChangeLessonVisit extends ChangeLessonVisitEvent {
  final Lesson lesson;

  GetChangeLessonVisit(this.lesson);
}