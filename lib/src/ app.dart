// # Root widget and routes

import 'package:flutter/material.dart';
import 'package:team_banao/src/screens/home_screen.dart';

import 'theme/app_theme.dart';

class TeamBanaoApp extends StatelessWidget {
  const TeamBanaoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team Banao',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
