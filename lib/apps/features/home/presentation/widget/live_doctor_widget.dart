import 'package:doctorhunt_app/apps/features/home/data/models/doctor_models.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_horizontal_list.dart';


class LiveDoctorList extends StatelessWidget {
  final List<LiveDoctorModel> doctors;

  const LiveDoctorList({
    super.key,
    required this.doctors,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 168,
      child: CustomHorizontalList<LiveDoctorModel>(
        items: doctors,
        spacing: 14,
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        itemBuilder: (context, doctor, index) {
          return _LiveDoctorCard(
            doctor: doctor,
          );
        },
      ),
    );
  }
}

class _LiveDoctorCard extends StatelessWidget {
  final LiveDoctorModel doctor;

  const _LiveDoctorCard({
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 116,
      height: 168,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFE8F1F4),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: doctor.imagePath.isEmpty
                ? const SizedBox()
                : Image.asset(
                    doctor.imagePath,
                    fit: BoxFit.cover,
                  ),
          ),

          Positioned(
            top: 11,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFF1744),
                borderRadius: BorderRadius.circular(3),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.videocam,
                    color: Colors.white,
                    size: 10,
                  ),
                  SizedBox(width: 3),
                  Text(
                    'LIVE',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Center(
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.20),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}