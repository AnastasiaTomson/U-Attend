import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:u_attend/src/locator.dart';
import 'package:u_attend/src/models/Lesson.dart';
import 'package:u_attend/src/services/lesson_service.dart';

part 'lesson_event.dart';
part 'lesson_state.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  LessonService lessonService = locator<LessonService>();

  LessonBloc() : super(LessonInitial()) {
    on<GetLesson>((event, emit) async {
      List<Lesson> lessons = await lessonService.getLessons();
      emit(LessonReceived(lessons));
    });
  }
}
