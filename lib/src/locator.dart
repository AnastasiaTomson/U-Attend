import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:u_attend/src/blocs/authentication/authentication_bloc.dart';
import 'package:u_attend/src/blocs/change_lesson_visit/change_lesson_visit_bloc.dart';
import 'package:u_attend/src/blocs/lesson/lesson_bloc.dart';
import 'package:u_attend/src/blocs/lesson_visit/lesson_visit_bloc.dart';
import 'package:u_attend/src/blocs/qr_lesson/qr_lesson_bloc.dart';
import 'package:u_attend/src/blocs/qr_scanner/qr_scanner_bloc.dart';
import 'package:u_attend/src/blocs/student_profile/student_profile_bloc.dart';
import 'package:u_attend/src/blocs/teacher_profile/teacher_profile_bloc.dart';
import 'package:u_attend/src/blocs/visits/visits_bloc.dart';
import 'package:u_attend/src/blocs/visits_teacher/visits_teacher_bloc.dart';
import 'package:u_attend/src/services/auth_service.dart';
import 'package:u_attend/src/services/lesson_service.dart';
import 'package:u_attend/src/services/student_service.dart';
import 'package:u_attend/src/services/teacher_service.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingletonAsync<SharedPreferences>(() async => await SharedPreferences.getInstance());
  locator.registerSingleton(Dio());

  //Services
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => LessonService());
  locator.registerLazySingleton(() => StudentService());
  locator.registerLazySingleton(() => TeacherService());

  //Blocs
  locator.registerFactory(() => AuthenticationBloc());
  locator.registerFactory(() => LessonBloc());
  locator.registerFactory(() => QrLessonBloc());
  locator.registerFactory(() => StudentProfileBloc());
  locator.registerFactory(() => TeacherProfileBloc());
  locator.registerFactory(() => QrScannerBloc());
  locator.registerFactory(() => LessonVisitBloc());
  locator.registerFactory(() => ChangeLessonVisitBloc());
  locator.registerFactory(() => VisitsTeacherBloc());
  locator.registerFactory(() => VisitsBloc());
}