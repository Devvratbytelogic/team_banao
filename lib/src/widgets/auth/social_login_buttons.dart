import 'package:flutter/material.dart';
import 'package:team_banao/src/core/constants.dart';
import 'package:team_banao/src/widgets/common/custom_button.dart';
import 'package:team_banao/src/widgets/common/custom_image.dart';

class SocialLoginButtons extends StatelessWidget {
  final VoidCallback? onGooglePressed;

  const SocialLoginButtons({
    super.key,
    this.onGooglePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIconButton(
          onPressed: onGooglePressed ?? () {},
          label: 'Continue with Google',
          icon: const CustomImage(
            imagePath: 'assets/images/icons/google.webp',
            width: 24,
            height: 24,
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        AppSpaces.h16,
      ],
    );
  }
}
