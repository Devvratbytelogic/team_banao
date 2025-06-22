import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team_banao/src/core/form_validators.dart';
import 'package:team_banao/src/routes/routes.dart';
import 'package:team_banao/src/screens/home_screen.dart';
import 'package:team_banao/src/widgets/auth/social_login_buttons.dart';
import 'package:team_banao/src/widgets/common/custom_button.dart';
import 'package:team_banao/src/widgets/common/custom_image.dart';
import 'package:team_banao/src/widgets/common/custom_input.dart';
import 'package:team_banao/src/widgets/common/custom_wave.dart';
import 'package:team_banao/src/widgets/layout/footer/copyright_notice.dart';
import 'package:team_banao/src/widgets/ui/custom_divider.dart';
import '../core/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isOtpLogin = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  bool otpSent = false;
  bool isResendAvailable = false;
  int resendCooldown = 30;
  Timer? _resendTimer;

  String lastSentNumber = "";

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _mobileController.dispose();
    _otpController.dispose();
    _resendTimer?.cancel();
    super.dispose();
  }

  void startResendCooldown() {
    setState(() {
      resendCooldown = 30;
      isResendAvailable = false;
    });

    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendCooldown == 1) {
        timer.cancel();
        setState(() {
          isResendAvailable = true;
        });
      } else {
        setState(() {
          resendCooldown--;
        });
      }
    });
  }

  void sendOtp() {
    final mobileError = FormValidator.validateMobile(
      _mobileController.text.trim(),
    );
    if (mobileError != null) {
      FormValidator.showValidationSnackBar(context, mobileError);
      return;
    }

    setState(() {
      otpSent = true;
      lastSentNumber = _mobileController.text.trim();
    });

    startResendCooldown();

    // ✅ Show success snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("OTP sent successfully."),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void verifyOtp() async{
    final otpError = FormValidator.validateOTP(_otpController.text.trim());
    if (otpError != null) {
      FormValidator.showValidationSnackBar(context, otpError);
      return;
    }

    // ✅ Show success snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("OTP verified successfully."),
        duration: Duration(seconds: 2),
      ),
    );

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_logged_in', true);
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
            (Route<dynamic> route) => false,
      );
    });
  }

  void loginWithEmail() async{
    final emailError = FormValidator.validateEmail(
      _emailController.text.trim(),
    );
    final passwordError = FormValidator.validatePassword(
      _passwordController.text.trim(),
    );
    if (emailError != null) {
      FormValidator.showValidationSnackBar(context, emailError);
      return;
    }
    if (passwordError != null) {
      FormValidator.showValidationSnackBar(context, passwordError);
      return;
    }

    final submittedData = '''
Email: ${_emailController.text}
Password: ${_passwordController.text}
''';

    // ✅ Show email login data snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(submittedData),
        duration: const Duration(seconds: 2),
      ),
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_logged_in', true);

    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to Home and clear stack
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
            (Route<dynamic> route) => false,
      );
    });
  }

  void resetOtpLogin() {
    setState(() {
      otpSent = false;
      isResendAvailable = false;
      _resendTimer?.cancel();
      resendCooldown = 30;
      _otpController.clear();
      lastSentNumber = "";
    });
  }

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
                  AppSpaces.h90,
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: AppContainers.screenPaddingHorizontal,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Welcome Back!",
                              style: textTheme.headlineMedium,
                            ),
                            AppSpaces.h8,
                            Text(
                              isOtpLogin
                                  ? "Login via OTP"
                                  : "Login to your account",
                            ),
                            AppSpaces.h16,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isOtpLogin = false;
                                      resetOtpLogin();
                                    });
                                  },
                                  child: Text(
                                    "Email Login",
                                    style: TextStyle(
                                      fontWeight: !isOtpLogin
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: !isOtpLogin
                                          ? AppColors.primary
                                          : AppColors.bodyText,
                                    ),
                                  ),
                                ),
                                const Text(" | "),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isOtpLogin = true;
                                      resetOtpLogin();
                                    });
                                  },
                                  child: Text(
                                    "OTP Login",
                                    style: TextStyle(
                                      fontWeight: isOtpLogin
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: isOtpLogin
                                          ? AppColors.primary
                                          : AppColors.bodyText,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            AppSpaces.h16,

                            if (!isOtpLogin) ...[
                              CustomInput(
                                label: "Email*",
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailController,
                              ),
                              AppSpaces.h16,
                              CustomInput(
                                label: "Password*",
                                obscureText: true,
                                enableToggle: true,
                                controller: _passwordController,
                                toggleOffIcon: const Icon(Icons.lock_outline),
                                toggleOnIcon: const Icon(Icons.lock_open),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.forgotPassword,
                                    );
                                  },
                                  child: const Text("Forgot Password?"),
                                ),
                              ),
                              AppSpaces.h4,
                              CustomButton(
                                label: 'Login',
                                variant: ButtonVariant.primary,
                                style: ButtonStyleType.roundedFull,
                                isFullWidth: true,
                                onPressed: loginWithEmail,
                              ),
                            ] else ...[
                              CustomInput(
                                label: "Mobile Number*",
                                controller: _mobileController,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                onChanged: (value) {
                                  final current = value.trim();
                                  if (otpSent && current != lastSentNumber) {
                                    resetOtpLogin();
                                  }
                                },
                              ),
                              AppSpaces.h16,

                              if (otpSent)
                                CustomInput(
                                  label: "Enter OTP*",
                                  controller: _otpController,
                                  keyboardType: TextInputType.number,
                                ),
                              AppSpaces.h8,

                              if (otpSent)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (isResendAvailable)
                                      TextButton(
                                        onPressed: sendOtp,
                                        child: const Text("Resend OTP"),
                                      )
                                    else
                                      Text("Resend OTP in $resendCooldown sec"),
                                  ],
                                ),
                              AppSpaces.h8,

                              CustomButton(
                                label: otpSent ? "Verify OTP" : "Send OTP",
                                isFullWidth: true,
                                variant: ButtonVariant.primary,
                                style: ButtonStyleType.roundedFull,
                                onPressed: () {
                                  if (!otpSent) {
                                    sendOtp();
                                  } else {
                                    verifyOtp();
                                  }
                                },
                              ),
                            ],

                            AppSpaces.h16,
                            const CustomDivider(text: "OR"),
                            AppSpaces.h4,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't have an account? "),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.registration,
                                    );
                                  },
                                  child: const Text("Sign Up"),
                                ),
                              ],
                            ),
                            AppSpaces.h16,
                            SocialLoginButtons(
                              onGooglePressed: () {
                                // TODO: Google login logic
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  AppSpaces.h44,
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
