import 'package:flutter/material.dart';

class SignupController {
  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  bool isPasswordVisible = false;

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}


class LoginController {
  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  bool isPasswordVisible = false;

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
