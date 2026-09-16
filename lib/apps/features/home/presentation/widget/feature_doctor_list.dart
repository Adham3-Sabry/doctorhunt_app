import 'package:doctorhunt_app/apps/features/home/data/models/doctor_models.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_horizontal_list.dart';


class FeatureDoctorList extends StatelessWidget {
  final List<FeatureDoctorModel> doctors;

  const FeatureDoctorList({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 132,
      child: CustomHorizontalList<FeatureDoctorModel>(
        items: doctors,
        spacing: 12,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, doctor, index) {
          return _FeatureDoctorCard(doctor: doctor);
        },
      ),
    );
  }
}

class _FeatureDoctorCard extends StatelessWidget {
  final FeatureDoctorModel doctor;

  const _FeatureDoctorCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.favorite_border,
                size: 12,
                color: Color(0xFF8B95AF),
              ),

              Row(
                children: [
                  const Icon(Icons.star, size: 11, color: Color(0xFFFFD34E)),
                  const SizedBox(width: 2),
                  Text(
                    doctor.rating.toString(),
                    style: const TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 7),

          Container(
            width: 48,
            height: 48,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFEAF0F1),
            ),
            child: doctor.imagePath.isEmpty
                ? const SizedBox()
                : Image.asset(doctor.imagePath, fit: BoxFit.cover),
          ),

          const SizedBox(height: 5),

          Text(
            doctor.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'Rubik',
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Color(0xFF303030),
            ),
          ),

          const SizedBox(height: 3),

          Text(
            '\$${doctor.price.toStringAsFixed(2)}/ hours',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'Rubik',
              fontSize: 8,
              color: Color(0xFF10B981),
            ),
          ),
        ],
      ),
    );
  }
}
