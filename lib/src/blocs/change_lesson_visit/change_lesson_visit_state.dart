part of 'change_lesson_visit_bloc.dart';

@immutable
abstract class ChangeLessonVisitState {}

class ChangeLessonVisitInitial extends ChangeLessonVisitState {}

class ChangeLessonVisitNotReceived extends ChangeLessonVisitState {}

class SuccessChangeLessonVisitReceived extends ChangeLessonVisitState {}

class ChangeLessonVisitReceived extends ChangeLessonVisitState {
  final List<Attend> attends;

  ChangeLessonVisitReceived(this.attends);
}
