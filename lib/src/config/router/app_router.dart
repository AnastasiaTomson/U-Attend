import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:u_attend/src/models/Lesson.dart';
import 'package:u_attend/src/views/authentication_view.dart';
import 'package:u_attend/src/views/change_lesson_visit_view.dart';
import 'package:u_attend/src/views/check_in_view.dart';
import 'package:u_attend/src/views/error_view.dart';
import 'package:u_attend/src/views/lesson_view.dart';
import 'package:u_attend/src/views/lesson_visit_view.dart';
import 'package:u_attend/src/views/profile_view.dart';
import 'package:u_attend/src/views/qr_lesson_view.dart';
import 'package:u_attend/src/views/qr_scanner_view.dart';
import 'package:u_attend/src/views/scan_status_view.dart';
import 'package:u_attend/src/views/visits_view.dart';
import 'package:u_attend/src/views/teacher_profile_view.dart';
import 'package:u_attend/src/views/visits_teacher_view.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/authentication':
        return _materialRoute(AuthenticationView());
      case '/check-in':
        return _bottomBarRoute(CheckInView());
      case '/profile':
        return _bottomBarRoute(ProfileView());
      case '/visits':
        return _bottomBarRoute(VisitsView());
      case '/teacher-profile':
        return _bottomBarRoute(TeacherProfileView());
      case '/lesson':
        return _bottomBarRoute(LessonView());
      case '/qr-lesson':
        return _materialRoute(QRLessonView(lesson: args as Lesson));
      case '/qr-scanner':
        return _materialRoute(QRScannerView());
      case '/visits-teacher':
        return _bottomBarRoute(VisitsTeacherView());
      case '/lesson-visit':
        return _materialRoute(LessonVisitView(lesson: args as Lesson));
      case '/change-lesson-visit':
        return _materialRoute(ChangeLessonVisitView(lesson: args as Lesson));
      case '/qr-success':
        return _materialRoute(SuccessView(message: args as String));
      case '/qr-error':
        return _materialRoute(ErrorView(message: args as String));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  static Route<dynamic> _bottomBarRoute(Widget view) {
    return PageTransition(
      child: view,
      type: PageTransitionType.fade,
      duration: Duration(milliseconds: 100)
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Text('Route not found'),
        ),
      );
    });
  }
}
