import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_banao/src/widgets/common/custom_button.dart';
import 'package:team_banao/src/widgets/common/custom_input.dart';
import 'package:team_banao/src/widgets/ui/custom_divider.dart';
import '../core/constants.dart'; // Assumes AppColors is defined here

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppContainers.screenPaddingHorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpaces.h24,
                Text("Welcome Back!", style: textTheme.headlineMedium),
                AppSpaces.h8,
                Text("Login to your account"),
                AppSpaces.h32,

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

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Forgot password logic
                    },
                    child: Text("Forgot Password?"),
                  ),
                ),
                AppSpaces.h16,

                // Login Button
                CustomButton(
                  label: 'Login',
                  variant: ButtonVariant.primary,
                  style: ButtonStyleType.roundedFull,
                  isFullWidth: true,
                  onPressed: () {},
                ),
                AppSpaces.h24,

                // Divider
                const CustomDivider(text: "OR"),
                AppSpaces.h24,

                // Register Prompt
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        // Navigate to register screen
                      },
                      child: Text("Sign Up"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
