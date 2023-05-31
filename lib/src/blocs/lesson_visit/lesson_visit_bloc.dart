import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:u_attend/src/locator.dart';
import 'package:u_attend/src/models/Attend.dart';
import 'package:u_attend/src/models/Lesson.dart';
import 'package:u_attend/src/services/lesson_service.dart';

part 'lesson_visit_event.dart';
part 'lesson_visit_state.dart';

class LessonVisitBloc extends Bloc<LessonVisitEvent, LessonVisitState> {
  LessonService lessonService = locator<LessonService>();

  LessonVisitBloc() : super(LessonVisitInitial()) {
    on<GetLessonVisit>((event, emit) async{
      List<Attend> attends = await lessonService.getLessonVisit(event.lesson);
      int count_student_attend = 0;
      int count_student_all = attends.length;
      int percent_attend_students = 0;
      for (Attend a in attends){
        if (a.is_attend) {
          count_student_attend += 1;
        }
      }
      if (count_student_all > 0) {
        percent_attend_students =
            ((count_student_attend / count_student_all) * 100).round();
      }

      emit(LessonVisitReceived(attends, count_student_attend, count_student_all, percent_attend_students));
    });
  }
}
