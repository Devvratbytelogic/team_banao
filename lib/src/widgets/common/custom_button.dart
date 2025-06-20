import 'package:flutter/material.dart';
import 'package:team_banao/src/core/constants.dart';

enum ButtonVariant { primary, secondary, danger }
enum ButtonStyleType { roundedFull, standard }

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final ButtonVariant variant;
  final ButtonStyleType style;
  final bool isFullWidth;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
    this.style = ButtonStyleType.standard,
    this.isFullWidth = false,
  }) : super(key: key);

  Color _getBackgroundColor() {
    switch (variant) {
      case ButtonVariant.primary:
        return AppColors.primary;
      case ButtonVariant.secondary:
        return AppColors.secondary;
      case ButtonVariant.danger:
        return AppColors.danger;
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = style == ButtonStyleType.roundedFull
        ? BorderRadius.circular(30)
        : BorderRadius.circular(8);

    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _getBackgroundColor(),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: Text(
          label,
          style: const TextStyle(color: AppColors.white),
        ),
      ),
    );
  }
}



class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool isFullWidth;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
    this.isFullWidth = true,
    this.borderRadius = 10,
    this.padding = const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            AppSpaces.w8,
            Text(label),
          ],
        ),
      ),
    );
  }
}
