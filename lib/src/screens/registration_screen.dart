import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:team_banao/src/core/form_validators.dart';
import 'package:team_banao/src/widgets/common/custom_button.dart';
import 'package:team_banao/src/widgets/common/custom_input.dart';
import 'package:team_banao/src/widgets/ui/custom_divider.dart';
import 'package:team_banao/src/core/constants.dart';
import 'package:team_banao/src/routes/routes.dart';
import 'package:team_banao/src/widgets/common/custom_wave.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _teamNameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isChecked = false;

  // handle user registration
  void handleUserRegistration() {
    final teamNameError = FormValidator.validateTeamName(
      _teamNameController.text,
    );
    final nameError = FormValidator.validateName(_nameController.text);
    final emailError = FormValidator.validateEmail(_emailController.text);
    final mobileError = FormValidator.validateMobile(_mobileController.text);
    final passwordError = FormValidator.validatePassword(
      _passwordController.text,
    );
    final agreementError = FormValidator.validateTermsAgreement(_isChecked);

    if (teamNameError != null) {
      FormValidator.showValidationSnackBar(context, teamNameError);
      return;
    }
    if (nameError != null) {
      FormValidator.showValidationSnackBar(context, nameError);
      return;
    }
    if (emailError != null) {
      FormValidator.showValidationSnackBar(context, emailError);
      return;
    }
    if (mobileError != null) {
      FormValidator.showValidationSnackBar(context, mobileError);
      return;
    }
    if (passwordError != null) {
      FormValidator.showValidationSnackBar(context, passwordError);
      return;
    }
    if (agreementError != null) {
      FormValidator.showValidationSnackBar(context, agreementError);
      return;
    }

    // ✅ Show submitted data in SnackBar
    final submittedData = '''
Team Name: ${_teamNameController.text}
Full Name: ${_nameController.text}
Email: ${_emailController.text}
Mobile: ${_mobileController.text}
Referral Code: ${_referralController.text.isEmpty ? 'N/A' : _referralController.text}
Password: ${_passwordController.text}
''';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(submittedData),
        duration: const Duration(seconds: 2),
      ),
    );

    // ✅ Redirect to login screen after a delay
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }

  @override
  void dispose() {
    _teamNameController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _referralController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Top wave background
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
          Column(
            children: [
              AppBar(
                title: const Text('User Registration'),
                backgroundColor: AppColors.transparent,
              ),
              AppSpaces.h82,
              Text("Create Account", style: textTheme.headlineMedium),
              AppSpaces.h16,
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: AppContainers.screenPaddingHorizontal,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AppSpaces.h16,
                          CustomInput(
                            label: "Team Name*",
                            controller: _teamNameController,
                          ),
                          AppSpaces.h16,
                          CustomInput(
                            label: "Full Name*",
                            controller: _nameController,
                          ),
                          AppSpaces.h16,
                          CustomInput(
                            label: "Email*",
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                          ),
                          AppSpaces.h16,
                          CustomInput(
                            label: "Mobile Number*",
                            keyboardType: TextInputType.number,
                            controller: _mobileController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                            ],
                          ),
                          AppSpaces.h16,
                          CustomInput(
                            label: "Referral Code (optional)",
                            controller: _referralController,
                          ),
                          AppSpaces.h16,
                          CustomInput(
                            label: "Password*",
                            obscureText: true,
                            controller: _passwordController,
                            enableToggle: true,
                            toggleOffIcon: const Icon(Icons.lock_outline),
                            toggleOnIcon: const Icon(Icons.lock_open),
                          ),
                          AppSpaces.h16,

                          // ✅ Checkbox Section
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: _isChecked,
                                activeColor:
                                    AppColors.primary, // Checkbox fill color
                                onChanged: (value) {
                                  setState(() {
                                    _isChecked = value ?? false;
                                  });
                                },
                              ),
                              // AppSpaces.w,
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: AppColors.bodyText),
                                    children: [
                                      const TextSpan(
                                        text:
                                            "I confirm that I am 18 years of age or older and I agree to the ",
                                      ),
                                      TextSpan(
                                        text: "Terms & Conditions",
                                        style: const TextStyle(
                                          color: AppColors.primary,
                                        ),
                                        recognizer:
                                            TapGestureRecognizer()
                                              ..onTap = () {
                                                // Navigator.pushNamed(context, AppRoutes.termsAndConditions);
                                              },
                                      ),
                                      const TextSpan(text: " and "),
                                      TextSpan(
                                        text: "Privacy Policy",
                                        style: const TextStyle(
                                          color: AppColors.primary,
                                        ),
                                        recognizer:
                                            TapGestureRecognizer()
                                              ..onTap = () {
                                                // Navigator.pushNamed(context, AppRoutes.privacyPolicy);
                                              },
                                      ),
                                      const TextSpan(text: "."),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          AppSpaces.h24,
                          CustomButton(
                            label: "Register",
                            isFullWidth: true,
                            variant: ButtonVariant.primary,
                            style: ButtonStyleType.roundedFull,
                            onPressed: () {
                              handleUserRegistration();
                            },
                          ),
                          AppSpaces.h16,
                          const CustomDivider(text: "OR"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account? "),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    AppRoutes.login,
                                  );
                                },
                                child: const Text("Login"),
                              ),
                            ],
                          ),
                          AppSpaces.h16,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
