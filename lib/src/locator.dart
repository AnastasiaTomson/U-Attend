import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:u_attend/src/blocs/authentication/authentication_bloc.dart';
import 'package:u_attend/src/services/auth_service.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingletonAsync<SharedPreferences>(() async => await SharedPreferences.getInstance());
  locator.registerSingleton(Dio());

  //Services
  locator.registerLazySingleton(() => AuthService());

  //Blocs
  locator.registerFactory(() => AuthenticationBloc());
}