import 'package:flutter/material.dart';

class AppointmentDoctorCard extends StatelessWidget {
  final String doctorName;
  final String clinicName;
  final String price;
  final String imagePath;
  final String favoriteIconPath;

  const AppointmentDoctorCard({
    super.key,
    required this.doctorName,
    required this.clinicName,
    required this.price,
    required this.imagePath,
    required this.favoriteIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 88,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // =====================================================
          // DOCTOR IMAGE
          // =====================================================
          Container(
            width: 72,
            height: 68,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF4F6),
              borderRadius: BorderRadius.circular(7),
            ),
            child: imagePath.isEmpty
                ? const SizedBox()
                : Image.asset(imagePath, fit: BoxFit.cover),
          ),

          const SizedBox(width: 10),

          // =====================================================
          // DOCTOR INFO
          // =====================================================
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  doctorName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF303030),
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  clinicName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 11,
                    color: Color(0xFF8993AE),
                  ),
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    ...List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        size: 12,
                        color: index == 4
                            ? const Color(0xFFE0E4E7)
                            : const Color(0xFFFFCA3A),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // =====================================================
          // FAVORITE
          // =====================================================
          Padding(
            padding: const EdgeInsets.only(right: 4, bottom: 38),
            child: favoriteIconPath.isEmpty
                ? const Icon(Icons.favorite, color: Color(0xFFFF0000), size: 19)
                : Image.asset('asssets/images/like.png', width: 19, height: 19),
          ),
        ],
      ),
    );
  }
}
