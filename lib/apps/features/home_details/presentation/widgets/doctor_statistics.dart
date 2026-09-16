import 'package:doctorhunt_app/apps/features/home_details/data/models/doctor_details_model.dart';
import 'package:flutter/material.dart';

class DoctorStatistics extends StatelessWidget {
  final DoctorDetailsModel doctor;

  const DoctorStatistics({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35),
      padding: const EdgeInsets.all(10),
      height: 84,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _StatisticItem(value: doctor.running, title: 'Runing'),
          ),

          const SizedBox(width: 7),

          Expanded(
            child: _StatisticItem(value: doctor.ongoing, title: 'Ongoing'),
          ),

          const SizedBox(width: 7),

          Expanded(
            child: _StatisticItem(value: doctor.patient, title: 'Patient'),
          ),
        ],
      ),
    );
  }
}

class _StatisticItem extends StatelessWidget {
  final int value;
  final String title;

  const _StatisticItem({required this.value, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$value',
            style: const TextStyle(
              fontFamily: 'Rubik',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFF303030),
            ),
          ),

          const SizedBox(height: 2),

          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Rubik',
              fontSize: 11,
              color: Color(0xFF8993AE),
            ),
          ),
        ],
      ),
    );
  }
}
