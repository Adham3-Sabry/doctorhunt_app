import 'package:doctorhunt_app/apps/features/select_time/data/models/appointment_day_model.dart';
import 'package:flutter/material.dart';

class AppointmentDateCard extends StatelessWidget {
  final AppointmentDayModel day;
  final bool selected;
  final VoidCallback onTap;

  const AppointmentDateCard({
    super.key,
    required this.day,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeInOut,
        width: 130,
        height: 54,
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF08BF8A) : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: selected ? const Color(0xFF08BF8A) : const Color(0xFFDDE8EC),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${day.day}, ${day.date}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: selected ? Colors.white : const Color(0xFF303030),
              ),
            ),

            const SizedBox(height: 3),

            Text(
              day.availableSlots == 0
                  ? 'No slots available'
                  : '${day.availableSlots} slots available',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 9,
                fontWeight: FontWeight.w400,
                color: selected ? Colors.white : const Color(0xFF8993AE),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
