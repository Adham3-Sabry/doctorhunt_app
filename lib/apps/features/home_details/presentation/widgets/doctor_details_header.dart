import 'package:flutter/material.dart';

class DoctorDetailsHeader extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onSearch;

  const DoctorDetailsHeader({
    super.key,
    required this.onBack,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 16,
                color: Color(0xFF71809F),
              ),
            ),
          ),

          const SizedBox(width: 18),

          const Expanded(
            child: Text(
              'Doctor Details',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF303030),
              ),
            ),
          ),

          GestureDetector(
            onTap: onSearch,
            child: const Icon(Icons.search, size: 25, color: Color(0xFF71809F)),
          ),
        ],
      ),
    );
  }
}
