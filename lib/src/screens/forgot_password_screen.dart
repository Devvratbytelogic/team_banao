import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:team_banao/src/core/form_validators.dart';
import 'package:team_banao/src/widgets/common/custom_button.dart';
import 'package:team_banao/src/widgets/common/custom_input.dart';
import 'package:team_banao/src/core/constants.dart';
import 'package:team_banao/src/widgets/common/custom_wave.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  int currentStep = 1;
  bool isEmailMode = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _mobileController.dispose();
    _otpController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void sendOtp() {
    String? error;
    if (isEmailMode) {
      error = FormValidator.validateEmail(_emailController.text.trim());
    } else {
      error = FormValidator.validateMobile(_mobileController.text.trim());
    }

    if (error != null) {
      FormValidator.showValidationSnackBar(context, error);
      return;
    }

    setState(() {
      currentStep = 2;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("OTP sent to your ${isEmailMode ? 'email' : 'mobile number'}"),
      ),
    );
  }

  void verifyOtp() {
    final otpError = FormValidator.validateOTP(_otpController.text.trim());
    if (otpError != null) {
      FormValidator.showValidationSnackBar(context, otpError);
      return;
    }

    setState(() {
      currentStep = 3;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("OTP verified")),
    );
  }

  void resetPassword() {
    final passwordError = FormValidator.validatePassword(_newPasswordController.text.trim());
    final confirmPasswordError = FormValidator.validateConfirmPassword(
      _confirmPasswordController.text.trim(),
      _newPasswordController.text.trim(),
    );

    if (passwordError != null) {
      FormValidator.showValidationSnackBar(context, passwordError);
      return;
    }

    if (confirmPasswordError != null) {
      FormValidator.showValidationSnackBar(context, confirmPasswordError);
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Password successfully reset.")),
    );

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        children: [
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
                title: const Text('Forgot Password'),
                backgroundColor: AppColors.transparent,
                elevation: 0,
              ),
              AppSpaces.h82,
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: AppContainers.screenPaddingHorizontal,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AppSpaces.h8,
                          Text("Reset Password", style: textTheme.headlineMedium),
                          AppSpaces.h16,

                          // Toggle Email / Mobile
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero, // Remove extra padding
                                  minimumSize: Size(0, 0),  // Shrink size
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink tap area
                                ),
                                onPressed: () {
                                  setState(() {
                                    isEmailMode = true;
                                    currentStep = 1;
                                  });
                                },
                                child: Text(
                                  "Email",
                                  style: TextStyle(
                                    fontWeight: isEmailMode ? FontWeight.bold : FontWeight.normal,
                                    color: isEmailMode ? AppColors.primary : AppColors.bodyText,
                                  ),
                                ),
                              ),
                              const Text(" | "),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(0, 0),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isEmailMode = false;
                                    currentStep = 1;
                                  });
                                },
                                child: Text(
                                  "Mobile",
                                  style: TextStyle(
                                    fontWeight: !isEmailMode ? FontWeight.bold : FontWeight.normal,
                                    color: !isEmailMode ? AppColors.primary : AppColors.bodyText,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          AppSpaces.h24,

                          // Step 1: Input
                          if (currentStep == 1) ...[
                            isEmailMode
                                ? CustomInput(
                              label: "Enter your email",
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                            )
                                : CustomInput(
                              label: "Enter your mobile number",
                              keyboardType: TextInputType.phone,
                              controller: _mobileController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                            ),
                            AppSpaces.h24,
                            CustomButton(
                              label: "Send OTP",
                              isFullWidth: true,
                              variant: ButtonVariant.primary,
                              style: ButtonStyleType.roundedFull,
                              onPressed: sendOtp,
                            ),
                          ],

                          // Step 2: OTP
                          if (currentStep == 2) ...[
                            CustomInput(
                              label: "Enter OTP",
                              keyboardType: TextInputType.number,
                              controller: _otpController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(6),
                              ],
                            ),
                            AppSpaces.h24,
                            CustomButton(
                              label: "Verify OTP",
                              isFullWidth: true,
                              variant: ButtonVariant.primary,
                              style: ButtonStyleType.roundedFull,
                              onPressed: verifyOtp,
                            ),
                          ],

                          // Step 3: Reset Password
                          if (currentStep == 3) ...[
                            CustomInput(
                              label: "New Password",
                              obscureText: true,
                              controller: _newPasswordController,
                            ),
                            AppSpaces.h16,
                            CustomInput(
                              label: "Confirm Password",
                              obscureText: true,
                              controller: _confirmPasswordController,
                            ),
                            AppSpaces.h24,
                            CustomButton(
                              label: "Reset Password",
                              isFullWidth: true,
                              variant: ButtonVariant.primary,
                              style: ButtonStyleType.roundedFull,
                              onPressed: resetPassword,
                            ),
                          ],
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
