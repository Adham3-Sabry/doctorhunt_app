import 'package:doctorhunt_app/apps/features/home_details/data/models/doctor_details_model.dart';
import 'package:flutter/material.dart';

class DoctorInfoCard extends StatelessWidget {
  final DoctorDetailsModel doctor;
  final VoidCallback onBookNow;

  const DoctorInfoCard({
    super.key,
    required this.doctor,
    required this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(18),
      height: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // =================================================
                // DOCTOR IMAGE
                // =================================================
                Container(
                  width: 91,
                  height: 88,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF5F7),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: doctor.doctorImagePath.isEmpty
                      ? const SizedBox()
                      : Image.asset(doctor.doctorImagePath, fit: BoxFit.cover),
                ),

                const SizedBox(width: 12),

                // =================================================
                // DOCTOR INFO
                // =================================================
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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

                      const SizedBox(height: 4),

                      Text(
                        doctor.specialty,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 13,
                          color: Color(0xFF8993AE),
                        ),
                      ),

                      const SizedBox(height: 9),

                      Row(
                        children: [
                          ...List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              size: 16,
                              color: index == 4
                                  ? const Color(0xFFE1E5E7)
                                  : const Color(0xFFFFCA3A),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // =================================================
                // FAVORITE
                // =================================================
                if (doctor.favoriteIconPath.isNotEmpty)
                  Image.asset('asssets/images/like.png', width: 23, height: 23)
                else
                  const Icon(Icons.favorite, color: Colors.red, size: 24),
              ],
            ),
          ),

          const SizedBox(height: 7),

          // =====================================================
          // PRICE + BOOK BUTTON
          // =====================================================
          Row(
            children: [
              const SizedBox(width: 103),

              Expanded(
                child: Text(
                  '\$ ${doctor.price}/hr',
                  style: const TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 14,
                    color: Color(0xFF8993AE),
                  ),
                ),
              ),

              SizedBox(
                width: 140,
                height: 33,
                child: ElevatedButton(
                  onPressed: onBookNow,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF08BF8A),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'Book Now',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
