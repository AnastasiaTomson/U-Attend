import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:u_attend/src/locator.dart';
import 'package:u_attend/src/models/Student.dart';
import 'package:u_attend/src/utils/constants.dart';

class StudentService {
  SharedPreferences prefs = locator<SharedPreferences>();
  Dio dio = locator<Dio>();

  Future<Student?> getStudent() async {
    try {
      var response = await dio.get(
        baseUrl + '/api/student/profile/',
        options: Options(
          headers: {
            'Authorization': 'Bearer ' + prefs.getString(accessKey)!
          }
        ),
      );
      if(response.statusCode == 200) {
        return Student.fromJson(response.data);
      }
      else return null;
    } catch (ex) {
      return null;
    }
  }
}