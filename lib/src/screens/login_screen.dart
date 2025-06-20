import 'package:flutter/material.dart';
import 'package:team_banao/src/widgets/auth/social_login_buttons.dart';
import 'package:team_banao/src/widgets/common/custom_button.dart';
import 'package:team_banao/src/widgets/common/custom_image.dart';
import 'package:team_banao/src/widgets/common/custom_input.dart';
import 'package:team_banao/src/widgets/common/custom_wave.dart';
import 'package:team_banao/src/widgets/layout/footer/copyright_notice.dart';
import 'package:team_banao/src/widgets/ui/custom_divider.dart';
import '../core/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Top-left wave
              Positioned(
                top: 0,
                left: 0,
                child: CustomWave(
                  position: WavePosition.topLeft,
                  width: screenWidth,
                  height: 180,
                  gradient: AppColors.primaryGradient,
                  curveHeightFactor: 0.5,
                  curveOffsetFactor: 0.2,
                ),
              ),

              // Bottom-right wave (fixed to bottom of screen)
              Positioned(
                bottom: 0,
                right: 0,
                child: CustomWave(
                  position: WavePosition.bottomRight,
                  width: screenWidth,
                  height: 180,
                  gradient: AppColors.primaryGradient,
                  curveHeightFactor: 0.5,
                  curveOffsetFactor: 0.2,
                ),
              ),

              // Main content with scrollable and fixed footer
              Column(
                children: [
                  AppSpaces.h44,
                  Center(
                    child: CustomImage(
                      imagePath: 'assets/images/logos/logo-white.png',
                      width: 90,
                      height: 90,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: AppContainers.screenPaddingHorizontal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min, // Ensures Column takes only needed space
                            children: [
                              Text("Welcome Back!", style: textTheme.headlineMedium),
                              AppSpaces.h8,
                              Text("Login to your account"),
                              AppSpaces.h16,
                              CustomInput(
                                label: "Email",
                                keyboardType: TextInputType.emailAddress,
                              ),
                              AppSpaces.h16,
                              CustomInput(
                                label: "Password",
                                obscureText: true,
                                enableToggle: true,
                                toggleOffIcon: Icon(Icons.lock_outline),
                                toggleOnIcon: Icon(Icons.lock_open),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text("Forgot Password?"),
                                ),
                              ),
                              AppSpaces.h4,
                              CustomButton(
                                label: 'Login',
                                variant: ButtonVariant.primary,
                                style: ButtonStyleType.roundedFull,
                                isFullWidth: true,
                                onPressed: () {},
                              ),
                              AppSpaces.h16,
                              const CustomDivider(text: "OR"),
                              AppSpaces.h4,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have an account? "),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/registration');
                                    },
                                    child: Text("Sign Up"),
                                  ),
                                ],
                              ),
                              AppSpaces.h16,
                              SocialLoginButtons(
                                onGooglePressed: () {
                                  // TODO: Handle Google login logic
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  AppSpaces.h44,
                  // Fixed footer
                  const CopyrightNotice(),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}