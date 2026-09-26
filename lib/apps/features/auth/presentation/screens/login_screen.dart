import 'package:doctorhunt_app/apps/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctorhunt_app/apps/features/auth/presentation/bloc/auth_event.dart';
import 'package:doctorhunt_app/apps/features/auth/presentation/bloc/auth_state.dart';
import 'package:doctorhunt_app/apps/features/auth/presentation/controller/auth_controller.dart';
import 'package:doctorhunt_app/apps/features/auth/presentation/screens/forgot_password_sheet.dart';
import 'package:doctorhunt_app/apps/features/auth/presentation/widgets/auth_button.dart';
import 'package:doctorhunt_app/apps/features/auth/presentation/widgets/auth_social_button.dart';
import 'package:doctorhunt_app/apps/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = LoginController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void togglePassword() {
    setState(() {
      controller.isPasswordVisible = !controller.isPasswordVisible;
    });
  }

  void _login() {
    FocusScope.of(context).unfocus();

    context.read<AuthBloc>().add(
      AuthLoginRequested(
        email: controller.emailController.text.trim(),
        password: controller.passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          context.go('/home');
        }

        if (state.status == AuthStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? 'Something went wrong'),
            ),
          );
        }
      },
      builder: (context, state) {
        final bool isLoading = state.status == AuthStatus.loading;

        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Stack(
            children: [
              // =========================
              // BACKGROUND
              // =========================
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
              ),

              // =========================
              // TOP BLUE GLOW
              // =========================
              Positioned(
                top: -160,
                left: -150,
                child: Container(
                  width: 380,
                  height: 380,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFE5F7FF),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFE5F7FF),
                        blurRadius: 100,
                        spreadRadius: 40,
                      ),
                    ],
                  ),
                ),
              ),

              // =========================
              // BOTTOM GREEN GLOW
              // =========================
              Positioned(
                right: -170,
                bottom: -180,
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFC8F4E3),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFC8F4E3),
                        blurRadius: 100,
                        spreadRadius: 35,
                      ),
                    ],
                  ),
                ),
              ),

              // =========================
              // CONTENT
              // =========================
              SafeArea(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 125),

                            // =========================
                            // TITLE
                            // =========================
                            const Text(
                              'Welcome back',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF111111),
                              ),
                            ),

                            const SizedBox(height: 13),

                            // =========================
                            // SUBTITLE
                            // =========================
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                'You can search a course, apply course and find\n'
                                'scholarship for abroad studies',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 14,
                                  height: 1.55,
                                  color: Color(0xFF6F7C9E),
                                ),
                              ),
                            ),

                            const SizedBox(height: 79),

                            // =========================
                            // SOCIAL BUTTONS
                            // =========================
                            Row(
                              children: [
                                Expanded(
                                  child: AuthSocialButton(
                                    title: 'Google',
                                    iconPath: 'asssets/images/Google.png',
                                    onPressed: () {},
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: AuthSocialButton(
                                    title: 'Facebook',
                                    iconPath: 'asssets/images/face.png',
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 36),

                            // =========================
                            // EMAIL
                            // =========================
                            AuthTextField(
                              controller: controller.emailController,
                              hintText: 'Email',
                              keyboardType: TextInputType.emailAddress,
                              suffixIcon: const Icon(
                                Icons.check,
                                color: Color(0xFF71809F),
                                size: 20,
                              ),
                            ),

                            const SizedBox(height: 17),

                            // =========================
                            // PASSWORD
                            // =========================
                            AuthTextField(
                              controller: controller.passwordController,
                              hintText: 'Password',
                              isPassword: true,
                              obscureText: !controller.isPasswordVisible,
                              onTogglePassword: togglePassword,
                            ),

                            const SizedBox(height: 32),

                            // =========================
                            // LOGIN BUTTON
                            // =========================
                            SizedBox(
                              width: double.infinity,
                              child: isLoading
                                  ? const SizedBox(
                                      height: 52,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: Color(0xFF08BF8A),
                                        ),
                                      ),
                                    )
                                  : AuthPrimaryButton(
                                      title: 'Login',
                                      onPressed: _login,
                                    ),
                            ),

                            const SizedBox(height: 17),

                            // =========================
                            // FORGOT PASSWORD
                            // =========================
                            GestureDetector(
                              onTap: isLoading
                                  ? null
                                  : () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) {
                                          return const ForgotPasswordSheet();
                                        },
                                      );
                                    },
                              child: const Text(
                                'Forgot password',
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 14,
                                  color: Color(0xFF08BF8A),
                                ),
                              ),
                            ),

                            const SizedBox(height: 60),

                            // =========================
                            // SIGN UP
                            // =========================
                            GestureDetector(
                              onTap: () {
                                context.go('/signup');
                              },
                              child: const Text(
                                "Don't have an account? Join us",
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 14,
                                  color: Color(0xFF08BF8A),
                                ),
                              ),
                            ),

                            const SizedBox(height: 36),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
