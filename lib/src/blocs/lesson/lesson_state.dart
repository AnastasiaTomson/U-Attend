part of 'lesson_bloc.dart';

@immutable
abstract class LessonState {}

class LessonInitial extends LessonState {}

class LessonNotReceived extends LessonState {}

class LessonReceived extends LessonState {
  final List<Lesson> lessons;

  LessonReceived(this.lessons);
}

