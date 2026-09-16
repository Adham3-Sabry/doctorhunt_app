import 'package:flutter/material.dart';

class AppointmentActionButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool outlined;

  const AppointmentActionButton({
    super.key,
    required this.title,
    required this.onTap,
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: outlined ? Colors.white : const Color(0xFF08BF8A),
          foregroundColor: outlined ? const Color(0xFF08BF8A) : Colors.white,
          elevation: 0,
          side: outlined
              ? const BorderSide(color: Color(0xFF08BF8A), width: 1)
              : BorderSide.none,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Rubik',
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
