import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final String userName;
  final String imagePath;

  const HomeHeader({
    super.key,
    required this.userName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 45, 20, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi $userName!',
                  style: const TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 4),

                const Text(
                  'Find Your Doctor',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: 57,
            height: 57,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: imagePath.isEmpty
                ? const Icon(Icons.person, color: Color(0xFF8B95AF))
                : Image.asset(imagePath, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
