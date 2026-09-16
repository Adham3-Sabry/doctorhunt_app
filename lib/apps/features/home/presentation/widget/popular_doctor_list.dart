import 'package:doctorhunt_app/apps/features/home/data/models/doctor_models.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_horizontal_list.dart';


class PopularDoctorList extends StatelessWidget {
  final List<PopularDoctorModel> doctors;

  const PopularDoctorList({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 265,
      child: CustomHorizontalList<PopularDoctorModel>(
        items: doctors,
        spacing: 14,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, doctor, index) {
          return _PopularDoctorCard(doctor: doctor);
        },
      ),
    );
  }
}

class _PopularDoctorCard extends StatelessWidget {
  final PopularDoctorModel doctor;

  const _PopularDoctorCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
             context.go('/home-details');  },
      child: Container(
        width: 190,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(13),
                ),
                child: doctor.imagePath.isEmpty
                    ? const SizedBox()
                    : Image.asset(
                        doctor.imagePath,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
      
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      doctor.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF303030),
                      ),
                    ),
      
                    const SizedBox(height: 3),
      
                    Text(
                      doctor.specialty,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 11,
                        color: Color(0xFF9AA3B7),
                      ),
                    ),
      
                    const SizedBox(height: 4),
      
                    _RatingRow(rating: doctor.rating),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RatingRow extends StatelessWidget {
  final double rating;

  const _RatingRow({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          5,
          (index) => const Icon(Icons.star, color: Color(0xFFFFD34E), size: 15),
        ),
      ],
    );
  }
}
