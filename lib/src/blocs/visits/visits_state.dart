part of 'visits_bloc.dart';

@immutable
abstract class VisitsState {}

class VisitsInitial extends VisitsState {}

class VisitsNotReceived extends VisitsState {}

class VisitsReceived extends VisitsState {
  final List<LessonAttend> lessons;

  VisitsReceived(this.lessons);
}
