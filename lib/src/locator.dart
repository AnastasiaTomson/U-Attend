import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:u_attend/src/blocs/authentication/authentication_bloc.dart';
import 'package:u_attend/src/blocs/student_profile/student_profile_bloc.dart';
import 'package:u_attend/src/blocs/teacher_profile/teacher_profile_bloc.dart';
import 'package:u_attend/src/services/auth_service.dart';
import 'package:u_attend/src/services/student_service.dart';
import 'package:u_attend/src/services/teacher_service.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingletonAsync<SharedPreferences>(() async => await SharedPreferences.getInstance());
  locator.registerSingleton(Dio());

  //Services
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => StudentService());
  locator.registerLazySingleton(() => TeacherService());

  //Blocs
  locator.registerFactory(() => AuthenticationBloc());
  locator.registerFactory(() => StudentProfileBloc());
  locator.registerFactory(() => TeacherProfileBloc());
}