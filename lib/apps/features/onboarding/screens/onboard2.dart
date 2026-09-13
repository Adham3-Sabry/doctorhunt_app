
import 'package:doctorhunt_app/apps/features/onboarding/widgets/OnboardingBackground.dart';
import 'package:doctorhunt_app/apps/features/onboarding/widgets/OnboardingButton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 55),

            // =========================
            // IMAGE
            // =========================
            Container(
              width: 335,
              height: 335,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),

              // Add your second image here later
              
              child: ClipOval(
                child: Image.asset(
                  'asssets/images/doc 2.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 83),

            // =========================
            // TITLE
            // =========================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Choose Best Doctors',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                  height: 1.2,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // =========================
            // DESCRIPTION
            // =========================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 38),
              child: Text(
                'Contrary to popular belief, Lorem Ipsum is not '
                'simply random text. It has roots in a piece of it '
                'over 2000 years old.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF7D89A8),
                  height: 1.65,
                ),
              ),
            ),

            const Spacer(),

            // =========================
            // NEXT BUTTON
            // =========================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: OnboardingButton(
                title: 'Next',
                onPressed: () {
                   context.go('/onboarding-3');
                },
              ),
            ),

            const SizedBox(height: 18),

            // =========================
            // SKIP
            // =========================
            TextButton(
              onPressed: () {
                 context.go('/onboarding-3');
              },
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF72809F),
              ),
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}