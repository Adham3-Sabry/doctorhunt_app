import 'package:doctorhunt_app/generated/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds:5),
      () {
        if (mounted) {
          context.go('/onboarding-1');
        }
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),

          // Top Left - Light Blue Glow
          Positioned(
            top: -130,
            left: -120,
            child: Container(
              width: 330,
              height: 330,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFDDF5FF).withOpacity(0.9),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFDDF5FF).withOpacity(0.7),
                    blurRadius: 100,
                    spreadRadius: 50,
                  ),
                ],
              ),
            ),
          ),

          // Bottom Right - Mint Glow
          Positioned(
            right: -120,
            bottom: -150,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFC8F2E2).withOpacity(0.85),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFC8F2E2).withOpacity(0.8),
                    blurRadius: 110,
                    spreadRadius: 55,
                  ),
                ],
              ),
            ),
          ),

          // Main Content
          SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Doctor Hunt Logo
                  SvgPicture.asset(
                   ImageAssets.logo,
                    width: 70,
                    height: 70,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 14),

                  // App Name
                  const Text(
                    'Doctor Hunt',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF202020),
                      height: 1.1,
                      letterSpacing: -0.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}