import 'package:flutter/material.dart';
import 'package:team_banao/src/screens/home_screen.dart';
import 'package:team_banao/src/screens/login_screen.dart';
import 'package:team_banao/src/screens/registration_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String registration = '/registration';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registration:
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route defined')),
          ),
        );
    }
  }
}
