// # Root widget and routes

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team_banao/src/screens/home_screen.dart';
import 'package:team_banao/src/screens/login_screen.dart';

import 'theme/app_theme.dart';

class TeamBanaoApp extends StatelessWidget {
  const TeamBanaoApp({Key? key}) : super(key: key);

  Future<Widget> _getInitialScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    return isLoggedIn ? const HomeScreen() : const LoginScreen();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team Banao',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
      // initialRoute: AppRoutes.login,
      // onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
