import 'package:flutter/material.dart';
import 'package:team_banao/src/core/constants.dart'; // Assumes AppColors is defined here

class CustomDivider extends StatelessWidget {
  final Color dividerColor;
  final double thickness;
  final double horizontalPadding;
  final String text; // New parameter for the text

  const CustomDivider({
    super.key,
    this.dividerColor = AppColors.primary, // Default to AppColors.primary
    this.thickness = 1.0, // Default thickness
    this.horizontalPadding = 8.0, // Default padding around the text
    this.text = "OR", // Default text is "OR"
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: thickness,
            color: dividerColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Text(
            text, // Use the passed text
            style: TextStyle(
              color: dividerColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: thickness,
            color: dividerColor,
          ),
        ),
      ],
    );
  }
}