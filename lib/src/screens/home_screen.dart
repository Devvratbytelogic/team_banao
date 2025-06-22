import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team_banao/src/routes/routes.dart';
import 'package:team_banao/src/widgets/common/custom_button.dart';
import 'package:team_banao/src/core/constants.dart'; // for AppColors

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('is_logged_in');
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme; // Access AppTheme text styles

    return Scaffold(
      body: Padding(
        padding: AppContainers.screenPaddingHorizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading

            Text(
              'Welcome to Team Banao!',
              style: textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),

            // Body text
            Text(
              'Create your fantasy cricket team and compete with others. '
                  'Choose your players wisely and climb the leaderboard!',
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 32),
            // Custom Button
            Center(
              child: CustomButton(
                label: 'Primary Rounded',
                variant: ButtonVariant.secondary,
                style: ButtonStyleType.roundedFull,
                isFullWidth: true,
                onPressed: () => logout(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
