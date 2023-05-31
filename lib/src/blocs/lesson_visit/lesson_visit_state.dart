part of 'lesson_visit_bloc.dart';

@immutable
abstract class LessonVisitState {}

class LessonVisitInitial extends LessonVisitState {}

class LessonVisitNotReceived extends LessonVisitState {}

class LessonVisitReceived extends LessonVisitState {
  final List<Attend> attends;
  final int count_student_attend;
  final int count_student_all;
  final int percent_attend_students;

  LessonVisitReceived(this.attends, this.count_student_attend, this.count_student_all, this.percent_attend_students);
}