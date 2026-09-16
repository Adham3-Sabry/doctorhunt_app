import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onClear;

  const HomeSearchBar({super.key, required this.controller, this.onClear});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontFamily: 'Rubik',
          fontSize: 14,
          color: Color(0xFF303030),
        ),
        decoration: InputDecoration(
          hintText: 'Search.....',
          hintStyle: const TextStyle(
            fontFamily: 'Rubik',
            fontSize: 14,
            color: Color(0xFF7883A1),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFF7883A1),
            size: 21,
          ),
          suffixIcon: IconButton(
            onPressed: onClear,
            icon: const Icon(Icons.close, color: Color(0xFF7883A1), size: 19),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 17),
        ),
      ),
    );
  }
}
