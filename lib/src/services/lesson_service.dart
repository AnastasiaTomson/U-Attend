import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:u_attend/src/locator.dart';
import 'package:u_attend/src/models/Attend.dart';
import 'package:u_attend/src/models/Lesson.dart';
import 'package:u_attend/src/models/LessonAttend.dart';
import 'package:u_attend/src/utils/constants.dart';

class LessonService {
  SharedPreferences prefs = locator<SharedPreferences>();
  Dio dio = locator<Dio>();

  Future<List<Lesson>> getLessons() async {
    try {
      var response = await dio.get(
        baseUrl + '/api/lesson/',
        options: Options(headers: {
          'Authorization': 'Bearer ' + prefs.getString(accessKey)!
        }),
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data as List;
        return List.generate(
            data.length, (index) => Lesson.fromJson(data[index]));
      } else
        return [];
    } catch (ex) {
      return [];
    }
  }

  Future<List<LessonAttend>> getLessonsAttend() async {
    try {
      var response = await dio.get(
        baseUrl + '/api/teacher/attendance',
        options: Options(headers: {
          'Authorization': 'Bearer ' + prefs.getString(accessKey)!
        }),
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data as List;
        return List.generate(
            data.length, (index) => LessonAttend.fromJson(data[index]));
      } else
        return [];
    } catch (ex) {
      return [];
    }
  }

  Future<List<LessonAttend>> getStudentLessonsAttend() async {
    try {
      var response = await dio.get(
        baseUrl + '/api/student/attendance',
        options: Options(headers: {
          'Authorization': 'Bearer ' + prefs.getString(accessKey)!
        }),
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data as List;
        return List.generate(
            data.length, (index) => LessonAttend.fromJson(data[index]));
      } else
        return [];
    } catch (ex) {
      return [];
    }
  }

  Future<Lesson?> createQR(Lesson lesson) async {
    try {
      var response = await dio.post(
        baseUrl + '/api/create_lesson/',
        data: jsonEncode({
          'week': lesson.week,
          'type': lesson.type,
          'sync': lesson.sync,
          'time': lesson.time,
          'subject': lesson.subject,
          'place': lesson.place,
          'building': lesson.building,
          'room': lesson.room,
          'groups': lesson.groups.join(',')
        }),
        options: Options(headers: {
          'Authorization': 'Bearer ' + prefs.getString(accessKey)!
        }),
      );
      if (response.statusCode == 200) {
        return Lesson.fromJson(response.data);
      } else
        return null;
    } catch (ex) {
      return null;
    }
  }

  Future<List<Attend>> getLessonVisit(Lesson lesson) async {
    try {
      var response = await dio.get(
        baseUrl + '/api/teacher/attendance/' + lesson.id.toString(),
        options: Options(headers: {
          'Authorization': 'Bearer ' + prefs.getString(accessKey)!
        }),
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data as List;
        return List.generate(
            data.length, (index) => Attend.fromJson(data[index]));
      } else
        return [];
    } catch (ex) {
      return [];
    }
  }

  Future<List<Attend>> changeLessonVisit(Lesson lesson, List<String> students_id) async {
    try {
      var response = await dio.post(
        baseUrl + '/api/teacher/attendance/' + lesson.id.toString(),
        data: jsonEncode({
          'students_id': students_id
        }),
        options: Options(headers: {
          'Authorization': 'Bearer ' + prefs.getString(accessKey)!
        }),
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data as List;
        return List.generate(
            data.length, (index) => Attend.fromJson(data[index]));
      } else
        return [];
    } catch (ex) {
      return [];
    }
  }

  Future<Map<String, dynamic>> scanQR(int? lesson_id) async {
    try {
      var response = await dio.get(
        baseUrl + '/api/student/scan_qr/' + lesson_id.toString(),
        options: Options(headers: {
          'Authorization': 'Bearer ' + prefs.getString(accessKey)!
        }),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else
        return response.data;
    } catch (ex) {
      return {'status': false, 'message': 'Ошибка'};
    }
  }
}
