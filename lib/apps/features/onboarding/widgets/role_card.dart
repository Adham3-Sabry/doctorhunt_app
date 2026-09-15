import 'package:flutter/material.dart';


class RoleCard extends StatelessWidget {
  final String title;
  final String description;
  final String iconPath;
  final bool selected;
  final VoidCallback onTap;

  const RoleCard({
    super.key,
    required this.title,
    required this.description,
    required this.iconPath,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 122,
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFF4F9F7)
              : const Color(0xFFFAFCFB),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected
                ? const Color(0xFF007F5B)
                : const Color(0xFFE2E7E5),
            width: selected ? 2 : 1,
          ),
        ),
        child: Stack(
          children: [
            // =========================
            // SVG ICON
            // =========================
            Positioned(
              left: 24,
              top: 30,
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected
                      ? Colors.white
                      : const Color(0xFFE9F0EC),
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  iconPath,
                  width: 22,
                  height: 22,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // =========================
            // TITLE + DESCRIPTION
            // =========================
            Positioned(
              left: 76,
              top: 25,
              right: selected ? 50 : 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF20272B),
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Description
                  Text(
                    description,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF89919E),
                      height: 1.45,
                    ),
                  ),
                ],
              ),
            ),

            // =========================
            // SELECTED CHECK
            // =========================
            if (selected)
              Positioned(
                right: 17,
                top: 17,
                child: AnimatedScale(
                  scale: 1,
                  duration: const Duration(milliseconds: 180),
                  curve: Curves.easeOutBack,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF007F5B),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 17,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}