part of 'teacher_profile_bloc.dart';

@immutable
abstract class TeacherProfileState {}

class TeacherProfileInitial extends TeacherProfileState {}

class TeacherNotReceived extends TeacherProfileState {}

class TeacherReceived extends TeacherProfileState {
  final Teacher teacher;

  TeacherReceived(this.teacher);
}
