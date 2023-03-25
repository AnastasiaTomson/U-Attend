import 'package:flutter/material.dart';
import 'package:u_attend/src/views/authentication_view.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name) {
      case '/authentication':
        return _materialRoute(AuthenticationView());
      // case '/check-in':
      //   return _materialRoute();
      // case '/profile':
      //   return _materialRoute();
      // case '/visits':
      //   return _materialRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
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