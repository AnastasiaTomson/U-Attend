import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:u_attend/src/locator.dart';
import 'package:u_attend/src/models/Attend.dart';
import 'package:u_attend/src/models/Lesson.dart';
import 'package:u_attend/src/services/lesson_service.dart';

part 'change_lesson_visit_event.dart';
part 'change_lesson_visit_state.dart';

class ChangeLessonVisitBloc extends Bloc<ChangeLessonVisitEvent, ChangeLessonVisitState> {
  LessonService lessonService = locator<LessonService>();

  ChangeLessonVisitBloc() : super(ChangeLessonVisitInitial()) {
    on<ChangeLessonVisit>((event, emit) async{
      List<Attend> attends = await lessonService.changeLessonVisit(event.lesson, event.students_id);
      emit(SuccessChangeLessonVisitReceived());
    });

    on<GetChangeLessonVisit>((event, emit) async{
      List<Attend> attends = await lessonService.getLessonVisit(event.lesson);
      emit(ChangeLessonVisitReceived(attends));
    });
  }
}
