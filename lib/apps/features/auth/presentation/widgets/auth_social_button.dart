import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthSocialButton extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onPressed;

  const AuthSocialButton({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 54,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 3,
            shadowColor: Colors.black.withOpacity(0.06),
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF77819D),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 20,
                height: 20,
              ),

              const SizedBox(width: 12),

              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF7A84A1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}