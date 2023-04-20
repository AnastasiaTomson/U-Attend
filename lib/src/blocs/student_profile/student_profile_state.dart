part of 'student_profile_bloc.dart';

@immutable
abstract class StudentProfileState {}

class StudentProfileInitial extends StudentProfileState {}

class StudentNotReceived extends StudentProfileState {}

class StudentReceived extends StudentProfileState {
  final Student student;

  StudentReceived(this.student);
}
