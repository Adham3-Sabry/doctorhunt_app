import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;

  const SectionHeader({super.key, required this.title, this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Rubik',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFF303030),
            ),
          ),

          GestureDetector(
            onTap: onSeeAll,
            child: const Text(
              'See all>',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Color(0xFF7E88A5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
