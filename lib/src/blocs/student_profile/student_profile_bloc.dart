import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:u_attend/src/locator.dart';
import 'package:u_attend/src/models/Student.dart';
import 'package:u_attend/src/services/student_service.dart';

part 'student_profile_event.dart';
part 'student_profile_state.dart';

class StudentProfileBloc extends Bloc<StudentProfileEvent, StudentProfileState> {
  StudentService studentService = locator<StudentService>();

  StudentProfileBloc() : super(StudentProfileInitial()) {
    on<GetStudent>((event, emit) async {
      Student? student = await studentService.getStudent();
      student == null ? emit(StudentNotReceived()) : emit(StudentReceived(student));
    });
  }
}
