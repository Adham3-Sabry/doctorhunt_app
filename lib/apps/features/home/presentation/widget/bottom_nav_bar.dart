import 'package:flutter/material.dart';

class HomeBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const HomeBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavItem(
            icon: Icons.home_rounded,
            selected: currentIndex == 0,
            onTap: () => onTap(0),
          ),

          _NavItem(
            icon: Icons.favorite,
            selected: currentIndex == 1,
            onTap: () => onTap(1),
          ),

          _NavItem(
            icon: Icons.menu_book_rounded,
            selected: currentIndex == 2,
            onTap: () => onTap(2),
          ),

          _NavItem(
            icon: Icons.chat_bubble_rounded,
            selected: currentIndex == 3,
            onTap: () => onTap(3),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 47,
        height: 47,
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF08BF8A) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: selected ? Colors.white : const Color(0xFF8993B0),
          size: 24,
        ),
      ),
    );
  }
}
