import 'package:doctorhunt_app/apps/features/auth/presentation/controller/auth_controller.dart';
import 'package:doctorhunt_app/apps/features/auth/presentation/widgets/auth_button.dart';
import 'package:doctorhunt_app/apps/features/auth/presentation/widgets/auth_social_button.dart';
import 'package:doctorhunt_app/apps/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final SignupController controller = SignupController();

  bool agreedToTerms = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void togglePassword() {
    setState(() {
      controller.isPasswordVisible =
          !controller.isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

          // Top blue glow
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

          // Bottom green glow
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 125),

                    // =========================
                    // TITLE
                    // =========================
                    const Text(
                      'Join us to start searching',
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

                    const SizedBox(height: 69),

                    // =========================
                    // SOCIAL BUTTONS
                    // =========================
                    Row(
                      children: [
                        AuthSocialButton(
                          title: 'Google',
                          iconPath: 'asssets/images/Google.png',
                          onPressed: () {},
                        ),

                        const SizedBox(width: 15),

                        AuthSocialButton(
                          title: 'Facebook',
                          iconPath: 'asssets/images/face.png',
                          onPressed: () {},
                        ),
                      ],
                    ),

                    const SizedBox(height: 34),

                    // =========================
                    // NAME
                    // =========================
                    AuthTextField(
                      controller: controller.nameController,
                      hintText: 'Name',
                    ),

                    const SizedBox(height: 17),

                    // =========================
                    // EMAIL
                    // =========================
                    AuthTextField(
                      controller: controller.emailController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 17),

                    // =========================
                    // PASSWORD
                    // =========================
                    AuthTextField(
                      controller: controller.passwordController,
                      hintText: 'Password',
                      isPassword: true,
                      obscureText:
                          !controller.isPasswordVisible,
                      onTogglePassword: togglePassword,
                    ),

                    const SizedBox(height: 13),

                    // =========================
                    // TERMS
                    // =========================
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              agreedToTerms = !agreedToTerms;
                            });
                          },
                          child: AnimatedContainer(
                            duration:
                                const Duration(milliseconds: 180),
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: agreedToTerms
                                  ? const Color(0xFF08BF8A)
                                  : const Color(0xFFB4BDCE),
                            ),
                            child: agreedToTerms
                                ? const Icon(
                                    Icons.check,
                                    size: 11,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ),

                        const SizedBox(width: 11),

                        const Expanded(
                          child: Text(
                            'I agree with the Terms of Service & Privacy Policy',
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 12,
                              color: Color(0xFF68728E),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 54),

                    // =========================
                    // SIGN UP
                    // =========================
                    AuthPrimaryButton(
                      title: 'Sign up',
                      onPressed: () {
                        if (!agreedToTerms) {
                          return;
                        }

                        debugPrint(
                          controller.nameController.text,
                        );

                        debugPrint(
                          controller.emailController.text,
                        );

                        debugPrint(
                          controller.passwordController.text,
                        );
                      },
                    ),

                    const SizedBox(height: 16),

                    // =========================
                    // LOGIN
                    // =========================
                    GestureDetector(
                      onTap: () {
                        context.go('/login');
                      },
                      child: const Text(
                        'Have an account? Log in',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF08BF8A),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}