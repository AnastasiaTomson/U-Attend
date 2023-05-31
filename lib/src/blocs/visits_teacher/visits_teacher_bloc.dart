import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:u_attend/src/locator.dart';
import 'package:u_attend/src/models/LessonAttend.dart';
import 'package:u_attend/src/services/lesson_service.dart';

part 'visits_teacher_event.dart';
part 'visits_teacher_state.dart';

class VisitsTeacherBloc extends Bloc<VisitsTeacherEvent, VisitsTeacherState> {
  LessonService lessonService = locator<LessonService>();

  VisitsTeacherBloc() : super(VisitsTeacherInitial()) {
    on<GetLessonAttend>((event, emit) async {
      List<LessonAttend> lessons = await lessonService.getLessonsAttend();
      emit(LessonAttendReceived(lessons));
    });
  }
}
