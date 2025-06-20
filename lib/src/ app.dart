import 'package:flutter/material.dart';
import 'package:team_banao/src/routes/routes.dart';
import 'package:team_banao/src/theme/app_theme.dart';

class TeamBanaoApp extends StatelessWidget {
  final String initialRoute;

  const TeamBanaoApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team Banao',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: initialRoute,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
