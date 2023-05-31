part of 'visits_teacher_bloc.dart';

@immutable
abstract class VisitsTeacherState {}

class VisitsTeacherInitial extends VisitsTeacherState {}

class LessonAttendNotReceived extends VisitsTeacherState {}

class LessonAttendReceived extends VisitsTeacherState {
  final List<LessonAttend> lessons;

  LessonAttendReceived(this.lessons);
}
