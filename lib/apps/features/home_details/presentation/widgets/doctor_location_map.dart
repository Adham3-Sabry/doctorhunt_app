import 'package:flutter/material.dart';

class DoctorLocationMap extends StatelessWidget {
  final String mapImagePath;

  const DoctorLocationMap({super.key, required this.mapImagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 210,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: mapImagePath.isEmpty
            ? const Center(
                child: Icon(
                  Icons.map_outlined,
                  size: 45,
                  color: Color(0xFFB7C0D0),
                ),
              )
            : Image.asset(
                'asssets/images/map.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
