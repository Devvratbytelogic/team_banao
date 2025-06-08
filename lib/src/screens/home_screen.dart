import 'package:flutter/material.dart';
import 'package:team_banao/src/widgets/common/custom_button.dart';
import 'package:team_banao/src/core/constants.dart'; // for AppColors

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme; // Access AppTheme text styles

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Team Banao',
          style: textTheme.titleLarge?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
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
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
