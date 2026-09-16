import 'package:flutter/material.dart';

class TimeSlotButton extends StatelessWidget {
  final String time;
  final bool selected;
  final VoidCallback onTap;

  const TimeSlotButton({
    super.key,
    required this.time,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        width: 76,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF08BF8A) : const Color(0xFFEAF9F5),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          time,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: selected ? Colors.white : const Color(0xFF00B981),
          ),
        ),
      ),
    );
  }
}
