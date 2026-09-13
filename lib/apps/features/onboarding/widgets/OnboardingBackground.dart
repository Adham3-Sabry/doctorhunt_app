import 'package:flutter/material.dart';

class OnboardingBackground extends StatelessWidget {
  final Widget child;

  const OnboardingBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main white background
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
          ),

          // Top green circle
          Positioned(
            top: -105,
            left: -105,
            child: Container(
              width: 335,
              height: 335,
              decoration: const BoxDecoration(
                color: Color(0xFF0EBE7E),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Bottom light green glow
          Positioned(
            right: -145,
            bottom: -175,
            child: Container(
              width: 390,
              height: 390,
              decoration: BoxDecoration(
                color: const Color(0xFFD9F8ED),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFD9F8ED),
                    blurRadius: 90,
                    spreadRadius: 35,
                  ),
                ],
              ),
            ),
          ),

          child,
        ],
      ),
    );
  }
}