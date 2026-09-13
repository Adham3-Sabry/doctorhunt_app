import 'package:flutter/material.dart';

enum ForgotPasswordStep {
  email,
  code,
  resetPassword,
}

class ForgotPasswordController extends ChangeNotifier {
  // =========================
  // EMAIL
  // =========================

  final TextEditingController emailController =
      TextEditingController();

  // =========================
  // OTP
  // =========================

  final List<TextEditingController> codeControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  final List<FocusNode> codeFocusNodes = List.generate(
    4,
    (_) => FocusNode(),
  );

  // =========================
  // PASSWORD
  // =========================

  final TextEditingController newPasswordController =
      TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  // =========================
  // STATE
  // =========================

  ForgotPasswordStep currentStep = ForgotPasswordStep.email;

  bool isNewPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  // =========================
  // STEP NAVIGATION
  // =========================

  void goToCode() {
    currentStep = ForgotPasswordStep.code;
    notifyListeners();

    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        codeFocusNodes.first.requestFocus();
      },
    );
  }

  void goToResetPassword() {
    currentStep = ForgotPasswordStep.resetPassword;
    notifyListeners();
  }

  void goBack() {
    if (currentStep == ForgotPasswordStep.resetPassword) {
      currentStep = ForgotPasswordStep.code;
    } else if (currentStep == ForgotPasswordStep.code) {
      currentStep = ForgotPasswordStep.email;
    }

    notifyListeners();
  }

  // =========================
  // PASSWORD VISIBILITY
  // =========================

  void toggleNewPasswordVisibility() {
    isNewPasswordVisible = !isNewPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  // =========================
  // OTP
  // =========================

  String get verificationCode {
    return codeControllers.map((controller) {
      return controller.text;
    }).join();
  }

  void onCodeChanged(
    int index,
    String value,
  ) {
    if (value.isNotEmpty && index < 3) {
      codeFocusNodes[index + 1].requestFocus();
    }

    if (value.isEmpty && index > 0) {
      codeFocusNodes[index - 1].requestFocus();
    }

    notifyListeners();
  }

  // =========================
  // VALIDATION
  // =========================

  bool get isCodeComplete {
    return codeControllers.every(
      (controller) => controller.text.length == 1,
    );
  }

  bool get passwordsMatch {
    return newPasswordController.text ==
        confirmPasswordController.text;
  }

  // =========================
  // DISPOSE
  // =========================

  @override
  void dispose() {
    emailController.dispose();

    for (final controller in codeControllers) {
      controller.dispose();
    }

    for (final focusNode in codeFocusNodes) {
      focusNode.dispose();
    }

    newPasswordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }
}