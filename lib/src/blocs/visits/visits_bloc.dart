import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:u_attend/src/locator.dart';
import 'package:u_attend/src/models/LessonAttend.dart';
import 'package:u_attend/src/services/lesson_service.dart';

part 'visits_event.dart';
part 'visits_state.dart';

class VisitsBloc extends Bloc<VisitsEvent, VisitsState> {
  LessonService lessonService = locator<LessonService>();

  VisitsBloc() : super(VisitsInitial()) {
    on<GetLessonAttend>((event, emit) async {
      List<LessonAttend> lessons = await lessonService.getStudentLessonsAttend();
      emit(VisitsReceived(lessons));
    });
  }
}
