import 'package:doctorhunt_app/apps/features/onboarding/widgets/OnboardingButton.dart';
import 'package:doctorhunt_app/generated/image_assets.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../widgets/role_card.dart';

class ChooseRoleScreen extends StatefulWidget {
  const ChooseRoleScreen({super.key});

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
  String selectedRole = 'patient';

  void selectRole(String role) {
    setState(() {
      selectedRole = role;
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

          // Top light blue glow
          Positioned(
            top: -170,
            left: -150,
            child: Container(
              width: 390,
              height: 390,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFE1F6FF),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFE1F6FF),
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
                color: const Color(0xFFC9F3E2),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFC9F3E2),
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
            child: Column(
              children: [
                const SizedBox(height: 30),

                // =========================
                // LOGO
                // =========================
                Image.asset(
                  ImageAssets.logo,
                  width: 72,
                  height: 72,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 7),

                // =========================
                // APP NAME
                // =========================
                const Text(
                  'Doctor Hunt',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF222222),
                  ),
                ),

                const SizedBox(height: 56),

                // =========================
                // TITLE
                // =========================
                const Text(
                  'Choose your role',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 27,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF222222),
                  ),
                ),

                const SizedBox(height: 9),

                // =========================
                // SUBTITLE
                // =========================
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'The selected role determines the experience and\n'
                    'available features.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF858C9C),
                      height: 1.45,
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // =========================
                // PATIENT
                // =========================
                RoleCard(
                  title: 'Patient',
                  description:
                      'Find doctors, book\n'
                      'appointments,\n'
                      'and manage your medical\n'
                      'records.',
                  selected: selectedRole == 'patient',
                  onTap: () => selectRole('patient'),
                  iconPath: 'asssets/images/patient.png',
                ),

                const SizedBox(height: 16),

                // =========================
                // ADMIN
                // =========================
                RoleCard(
                  title: 'Admin',
                  description:
                      'Manage doctors, appointments,\n'
                      'users, and the platform.',
                  iconPath: 'asssets/images/admin.png',
                  selected: selectedRole == 'admin',
                  onTap: () => selectRole('admin'),
                ),

                const Spacer(),

                // =========================
                // CONTINUE BUTTON
                // =========================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: OnboardingButton(
                    title: 'Continue',
                    onPressed: () {
                      debugPrint('Selected role: $selectedRole');
                      context.go('/login');
                      // Navigate to the login screen for now
                      // بعدين نربطه بالـ route المناسب
                      //
                      // if (selectedRole == 'patient') {
                      //   context.go('/patient-login');
                      // } else {
                      //   context.go('/admin-login');
                      // }
                    },
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
