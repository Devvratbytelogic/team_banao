import 'package:flutter/material.dart';
import 'package:team_banao/src/routes/routes.dart';
import 'package:team_banao/src/screens/home_screen.dart';
import 'package:team_banao/src/screens/login_screen.dart';
import 'package:team_banao/src/theme/app_theme.dart';

class TeamBanaoApp extends StatelessWidget {
  final bool isLoggedIn;

  const TeamBanaoApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team Banao',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      onGenerateRoute: AppRoutes.generateRoute,
      // 👇 Set initial screen based on login status
      home: isLoggedIn ? const HomeScreen() : const LoginScreen(),
    );
  }
}
