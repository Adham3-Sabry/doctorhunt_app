import 'package:doctorhunt_app/apps/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctorhunt_app/apps/features/auth/presentation/bloc/auth_event.dart';
import 'package:doctorhunt_app/apps/features/auth/presentation/bloc/auth_state.dart';
import 'package:doctorhunt_app/apps/features/auth/presentation/controller/auth_controller.dart';
import 'package:doctorhunt_app/apps/features/auth/presentation/widgets/auth_button.dart';
import 'package:doctorhunt_app/apps/features/auth/presentation/widgets/auth_social_button.dart';
import 'package:doctorhunt_app/apps/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final SignupController controller = SignupController();

  String selectedRole = 'Patient';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _signUp() {
    FocusScope.of(context).unfocus();

    context.read<AuthBloc>().add(
      AuthSignUpRequested(
        name: controller.nameController.text.trim(),
        email: controller.emailController.text.trim(),
        password: controller.passwordController.text,
        role: selectedRole,
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

        if (state.status == AuthStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Account created successfully. Please check your email.',
              ),
            ),
          );

          context.go('/login');
        }

        if (state.status == AuthStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? 'Something went wrong.'),
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state.status == AuthStatus.loading;

        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
              ),

              // TOP GLOW
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

              // BOTTOM GLOW
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
                            const SizedBox(height: 95),

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

                            const Text(
                              'Create an account and start your journey\n'
                              'with us.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 14,
                                height: 1.55,
                                color: Color(0xFF6F7C9E),
                              ),
                            ),

                            const SizedBox(height: 50),

                            // SOCIAL
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

                            const SizedBox(height: 30),

                            // NAME
                            AuthTextField(
                              controller: controller.nameController,
                              hintText: 'Name',
                            ),

                            const SizedBox(height: 16),

                            // EMAIL
                            AuthTextField(
                              controller: controller.emailController,
                              hintText: 'Email',
                              keyboardType: TextInputType.emailAddress,
                            ),

                            const SizedBox(height: 16),

                            // PASSWORD
                            AuthTextField(
                              controller: controller.passwordController,
                              hintText: 'Password',
                              isPassword: true,
                              obscureText: !controller.isPasswordVisible,
                              onTogglePassword: () {
                                setState(() {
                                  controller.isPasswordVisible =
                                      !controller.isPasswordVisible;
                                });
                              },
                            ),

                            const SizedBox(height: 18),

                            // ROLE
                            Row(
                              children: [
                                Expanded(
                                  child: _RoleButton(
                                    title: 'Patient',
                                    selected: selectedRole == 'Patient',
                                    onTap: () {
                                      setState(() {
                                        selectedRole = 'Patient';
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _RoleButton(
                                    title: 'Doctor',
                                    selected: selectedRole == 'Doctor',
                                    onTap: () {
                                      setState(() {
                                        selectedRole = 'Doctor';
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 28),

                            // SIGN UP
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
                                      title: 'Sign up',
                                      onPressed: _signUp,
                                    ),
                            ),

                            const SizedBox(height: 35),

                            GestureDetector(
                              onTap: () {
                                context.go('/login');
                              },
                              child: const Text(
                                'Have an account? Log in',
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 14,
                                  color: Color(0xFF08BF8A),
                                ),
                              ),
                            ),

                            const SizedBox(height: 30),
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

class _RoleButton extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _RoleButton({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF08BF8A) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? const Color(0xFF08BF8A) : const Color(0xFFE2E6ED),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: selected ? Colors.white : const Color(0xFF667085),
            ),
          ),
        ),
      ),
    );
  }
}
