import 'package:doctorhunt_app/apps/features/auth/presentation/controller/forgot_password_controller.dart';
import 'package:doctorhunt_app/apps/features/auth/presentation/widgets/auth_button.dart';
import 'package:doctorhunt_app/apps/features/auth/presentation/widgets/auth_otp_field.dart';
import 'package:doctorhunt_app/apps/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';



class ForgotPasswordSheet extends StatefulWidget {
  const ForgotPasswordSheet({super.key});

  @override
  State<ForgotPasswordSheet> createState() => _ForgotPasswordSheetState();
}

class _ForgotPasswordSheetState extends State<ForgotPasswordSheet> {
  late final ForgotPasswordController controller;

  @override
  void initState() {
    super.initState();

    controller = ForgotPasswordController();

    controller.addListener(_onControllerChanged);
  }

  void _onControllerChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    controller.removeListener(_onControllerChanged);
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 18,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: _buildCurrentStep(),
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentStep() {
    switch (controller.currentStep) {
      case ForgotPasswordStep.email:
        return _buildEmailStep();

      case ForgotPasswordStep.code:
        return _buildCodeStep();

      case ForgotPasswordStep.resetPassword:
        return _buildResetPasswordStep();
    }
  }

  // ============================================================
  // STEP 1 - FORGOT PASSWORD
  // ============================================================

  Widget _buildEmailStep() {
    return Column(
      key: const ValueKey('email-step'),
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHandle(),

        const SizedBox(height: 55),

        const Text(
          'Forgot password',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF111111),
          ),
        ),

        const SizedBox(height: 12),

        const Text(
          'Enter your email for the verification process,\n'
          'we will send 4 digits code to your email.',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 14,
            height: 1.6,
            color: Color(0xFF647292),
          ),
        ),

        const SizedBox(height: 36),

        AuthTextField(
          controller: controller.emailController,
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),

        const SizedBox(height: 31),

        AuthPrimaryButton(
          title: 'Continue',
          onPressed: () {
            if (controller.emailController.text.trim().isEmpty) {
              return;
            }

            controller.goToCode();
          },
        ),

        const SizedBox(height: 30),
      ],
    );
  }

  // ============================================================
  // STEP 2 - ENTER CODE
  // ============================================================

  Widget _buildCodeStep() {
    return Column(
      key: const ValueKey('code-step'),
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHandle(),

        const SizedBox(height: 55),

        const Text(
          'Enter 4 Digits Code',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF111111),
          ),
        ),

        const SizedBox(height: 12),

        const Text(
          'Enter the 4 digits code that you received on\n'
          'your email.',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 14,
            height: 1.6,
            color: Color(0xFF647292),
          ),
        ),

        const SizedBox(height: 29),

        // =========================
        // OTP FIELDS
        // =========================
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 0 : 8,
                right: index == 3 ? 0 : 8,
              ),
              child: AuthOtpField(
                controller: controller.codeControllers[index],
                focusNode: controller.codeFocusNodes[index],
                nextFocusNode: index < 3
                    ? controller.codeFocusNodes[index + 1]
                    : null,
                previousFocusNode: index > 0
                    ? controller.codeFocusNodes[index - 1]
                    : null,
                onChanged: (value) {
                  controller.onCodeChanged(index, value);
                },
              ),
            );
          }),
        ),

        const SizedBox(height: 40),

        AuthPrimaryButton(
          title: 'Continue',
          onPressed: () {
            if (!controller.isCodeComplete) {
              return;
            }

            controller.goToResetPassword();
          },
        ),

        const SizedBox(height: 30),
      ],
    );
  }

  // ============================================================
  // STEP 3 - RESET PASSWORD
  // ============================================================

  Widget _buildResetPasswordStep() {
    return Column(
      key: const ValueKey('reset-step'),
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHandle(),

        const SizedBox(height: 55),

        const Text(
          'Reset Password',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF111111),
          ),
        ),

        const SizedBox(height: 12),

        const Text(
          'Set the new password for your account so you can\n'
          'login and access all the features.',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 14,
            height: 1.6,
            color: Color(0xFF647292),
          ),
        ),

        const SizedBox(height: 30),

        // =========================
        // NEW PASSWORD
        // =========================
        AuthTextField(
          controller: controller.newPasswordController,
          hintText: 'New Password',
          isPassword: true,
          obscureText: !controller.isNewPasswordVisible,
          onTogglePassword: () {
            controller.toggleNewPasswordVisibility();
          },
        ),

        const SizedBox(height: 17),

        // =========================
        // CONFIRM PASSWORD
        // =========================
        AuthTextField(
          controller: controller.confirmPasswordController,
          hintText: 'Re-enter Password',
          isPassword: true,
          obscureText: !controller.isConfirmPasswordVisible,
          onTogglePassword: () {
            controller.toggleConfirmPasswordVisibility();
          },
        ),

        const SizedBox(height: 40),

        AuthPrimaryButton(
          title: 'Update Password',
          onPressed: () {
            if (controller.newPasswordController.text.isEmpty ||
                controller.confirmPasswordController.text.isEmpty) {
              return;
            }

            if (!controller.passwordsMatch) {
              return;
            }

            // هنا بعدين API / Firebase
            Navigator.of(context).pop();
          },
        ),

        const SizedBox(height: 30),
      ],
    );
  }

  // ============================================================
  // BOTTOM SHEET HANDLE
  // ============================================================

  Widget _buildHandle() {
    return Center(
      child: Container(
        width: 130,
        height: 5,
        decoration: BoxDecoration(
          color: const Color(0xFFC4C4C4),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
