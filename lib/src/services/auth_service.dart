import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:u_attend/src/locator.dart';
import 'package:u_attend/src/utils/constants.dart';

class AuthService {
  SharedPreferences prefs = locator<SharedPreferences>();
  Dio dio = locator<Dio>();

  Future<bool> authenticate(String login, String password, bool isStaff) async {
    try {
      var response = await dio.post(
          baseUrl + '/api/login/',
          data: {
            'login': login,
            'password': password,
            'is_staff': isStaff ? 'True' : 'False',
          }
      );
      if(response.statusCode == 201) {
        String accessToken = response.data['access_token'];
        String refreshToken = response.data['refresh_token'];
        Map<String, dynamic> accessPayload = JwtDecoder.decode(accessToken);
        Map<String, dynamic> refreshPayload = JwtDecoder.decode(refreshToken);
        prefs.setString(accessKey, accessToken);
        prefs.setString(accessExpKey, accessPayload['exp'].toString());
        prefs.setString(refreshKey, refreshToken);
        prefs.setString(refreshExpKey, refreshPayload['exp'].toString());
        prefs.setBool(isStaffKey, isStaff);
        return true;
      }
      else return false;
    } catch (ex) {
      return false;
    }
  }

  bool logout() {
    try {
      prefs.remove(accessKey);
      prefs.remove(accessExpKey);
      prefs.remove(refreshKey);
      prefs.remove(refreshExpKey);
      prefs.remove(isStaffKey);
      return true;
    }
    catch (ex) {
      return false;
    }
  }

  Future<bool> renewToken() async {
    try {
      var response = await dio.post(
        baseUrl + '/api/refresh/',
        data: {
          'refresh': prefs.getString(refreshKey)!,
        }
      );
      if(response.statusCode == 200) {
        String accessToken = response.data['access_token'];
        String refreshToken = response.data['refresh_token'];
        Map<String, dynamic> accessPayload = JwtDecoder.decode(accessToken);
        Map<String, dynamic> refreshPayload = JwtDecoder.decode(refreshToken);
        prefs.setString(accessKey, accessToken);
        prefs.setString(accessExpKey, accessPayload['exp'].toString());
        prefs.setString(refreshKey, refreshToken);
        prefs.setString(refreshExpKey, refreshPayload['exp'].toString());
        return true;
      }
      else return false;
    } catch (ex) {
      return false;
    }
  }
}