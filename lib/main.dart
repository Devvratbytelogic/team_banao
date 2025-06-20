import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team_banao/src/%20app.dart';
import 'package:team_banao/src/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(TeamBanaoApp(
    initialRoute: isLoggedIn ? AppRoutes.home : AppRoutes.login,
  ));
}
