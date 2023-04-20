import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:u_attend/src/locator.dart';
import 'package:u_attend/src/models/Teacher.dart';
import 'package:u_attend/src/utils/constants.dart';

class TeacherService {
  SharedPreferences prefs = locator<SharedPreferences>();
  Dio dio = locator<Dio>();

  Future<Teacher?> getTeacher() async {
    try {
      var response = await dio.get(
        baseUrl + '/api/teacher/profile/',
        options: Options(
          headers: {
            'Authorization': 'Bearer ' + prefs.getString(accessKey)!
          }
        ),
      );
      if(response.statusCode == 200) {
        return Teacher.fromJson(response.data);
      }
      else return null;
    } catch (ex) {
      return null;
    }
  }
}