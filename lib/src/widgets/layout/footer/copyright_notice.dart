import 'package:flutter/material.dart';
import 'package:team_banao/src/core/constants.dart';

class CopyrightNotice extends StatelessWidget {
  const CopyrightNotice({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final currentYear = DateTime.now().year;

    return Column(
      children: [
        Text(
          "© $currentYear Team Banao. All rights reserved.",
          style: textTheme.bodyMedium?.copyWith(color: AppColors.white),
        ),
        Text(
          "Developed by SarCODER",
          style: textTheme.bodyMedium?.copyWith(color: AppColors.white),
        ),
        AppSpaces.h24,
      ],
    );
  }
}
