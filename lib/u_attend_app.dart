import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:u_attend/src/config/router/app_router.dart';
import 'package:u_attend/src/config/themes/app_themes.dart';
import 'package:u_attend/src/config/themes/themes_provider.dart';
import 'package:u_attend/src/utils/constants.dart';

class UAttendApp extends StatelessWidget {
  const UAttendApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: kMaterialAppTitle,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeProvider.themeMode,
          initialRoute: '/authentication',
          onGenerateRoute: AppRouter.onGenerateRoute,
          // navigatorKey: NavigatorService().navigatorKey,
        );
      },
    );
  }
}