import 'package:flutter/material.dart';
import 'package:team_banao/src/widgets/common/custom_button.dart';
import 'package:team_banao/src/widgets/common/custom_input.dart';
import 'package:team_banao/src/widgets/ui/custom_divider.dart';
import 'package:team_banao/src/widgets/layout/footer/copyright_notice.dart';
import 'package:team_banao/src/core/constants.dart';
import 'package:team_banao/src/routes/routes.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers (optional)
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('User Registration'),
      ),
      body: Padding(
        padding: AppContainers.screenPaddingHorizontal,
        child: Column(
          children: [
            AppSpaces.h32,
            Text("Create Account", style: textTheme.headlineMedium),
            AppSpaces.h16,
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomInput(
                        label: "Full Name",
                        controller: _nameController,
                      ),
                      AppSpaces.h16,
                      CustomInput(
                        label: "Email",
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                      ),
                      AppSpaces.h16,
                      CustomInput(
                        label: "Password",
                        obscureText: true,
                        controller: _passwordController,
                        enableToggle: true,
                        toggleOffIcon: Icon(Icons.lock_outline),
                        toggleOnIcon: Icon(Icons.lock_open),
                      ),
                      AppSpaces.h24,
                      CustomButton(
                        label: "Register",
                        isFullWidth: true,
                        variant: ButtonVariant.primary,
                        style: ButtonStyleType.roundedFull,
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // TODO: Handle registration logic
                            Navigator.pushReplacementNamed(context, AppRoutes.login);
                          }
                        },
                      ),
                      AppSpaces.h16,
                      const CustomDivider(text: "OR"),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? "),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, AppRoutes.login);
                            },
                            child: Text("Login"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
