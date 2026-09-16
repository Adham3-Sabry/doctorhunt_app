import 'package:flutter/material.dart';

class DoctorServices extends StatelessWidget {
  final List<String> services;

  const DoctorServices({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Services',
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFF303030),
            ),
          ),

          const SizedBox(height: 10),

          ...List.generate(services.length, (index) {
            return _ServiceItem(
              number: index + 1,
              text: services[index],
              isLast: index == services.length - 1,
            );
          }),
        ],
      ),
    );
  }
}

class _ServiceItem extends StatelessWidget {
  final int number;
  final String text;
  final bool isLast;

  const _ServiceItem({
    required this.number,
    required this.text,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 46),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(
                bottom: BorderSide(color: Color(0xFFE8E8E8), width: 1),
              ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$number.',
            style: const TextStyle(
              fontFamily: 'Rubik',
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF08BF8A),
            ),
          ),

          const SizedBox(width: 9),

          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Rubik',
                fontSize: 12,
                color: Color(0xFF7883A1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
