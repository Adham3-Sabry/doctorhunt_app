import 'package:doctorhunt_app/apps/features/home_details/data/models/doctor_details_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/doctor_details_header.dart';
import '../widgets/doctor_info_card.dart';
import '../widgets/doctor_location_map.dart';
import '../widgets/doctor_services.dart';
import '../widgets/doctor_statistics.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    

    const doctor = DoctorDetailsModel(
      name: 'Dr. Pediatrician',
      specialty: 'Specialist Cardiologist',
      price: '28.00',

      // =========================================================
    
      // =========================================================
      doctorImagePath: '',

    
      favoriteIconPath: 'asssets/images/like.png',

      
      // =========================================================
      mapImagePath: 'asssets/images/map.png',

      running: 100,
      ongoing: 500,
      patient: 700,

      services: [
        'Patient care should be the number one priority.',
        'If you run your practice you know how frustrating.',
        'That’s why some of appointment reminder system.',
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [
          // =====================================================
          // BACKGROUND
          // =====================================================
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFE7F8FF), Colors.white, Color(0xFFE8FFF7)],
                stops: [0.0, 0.48, 1.0],
              ),
            ),
          ),

          // =====================================================
          // CONTENT
          // =====================================================
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 8, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // =================================================
                  // HEADER
                  // =================================================
                  DoctorDetailsHeader(
                    onBack: () {
                      context.go('/home');
                    },
                    onSearch: () {
                      // Search action
                    },
                  ),

                  const SizedBox(height: 35),

                  // =================================================
                  // DOCTOR CARD
                  // =================================================
                  DoctorInfoCard(
                    doctor: doctor,
                    onBookNow: () {
                      // Book Now action
                    },
                  ),

                  const SizedBox(height: 24),

                  // =================================================
                  // STATISTICS
                  // =================================================
                  DoctorStatistics(doctor: doctor),

                  const SizedBox(height: 27),

                  // =================================================
                  // SERVICES
                  // =================================================
                  DoctorServices(services: doctor.services),

                  const SizedBox(height: 25),

                  // =================================================
                  // MAP
                  // =================================================
                  DoctorLocationMap(mapImagePath: doctor.mapImagePath),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
