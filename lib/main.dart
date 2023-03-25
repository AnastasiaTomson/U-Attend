import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:u_attend/u_attend_app.dart';

Future<void> main() async {
  // await setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(UAttendApp())
  );
}
