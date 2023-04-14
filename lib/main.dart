import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:u_attend/src/locator.dart';
import 'package:u_attend/u_attend_app.dart';

Future<void> main() async {
  await setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  locator.isReady<SharedPreferences>().then((_) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((_) => runApp(UAttendApp())
    );
  });
}
