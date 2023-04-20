import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:u_attend/src/locator.dart';
import 'package:u_attend/src/models/Teacher.dart';
import 'package:u_attend/src/services/teacher_service.dart';

part 'teacher_profile_event.dart';
part 'teacher_profile_state.dart';

class TeacherProfileBloc extends Bloc<TeacherProfileEvent, TeacherProfileState> {
  TeacherService teacherService = locator<TeacherService>();

  TeacherProfileBloc() : super(TeacherProfileInitial()) {
    on<GetTeacher>((event, emit) async {
      Teacher? teacher = await teacherService.getTeacher();
      teacher == null ? emit(TeacherNotReceived()) : emit(TeacherReceived(teacher));
    });
  }
}
