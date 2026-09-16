import 'package:doctorhunt_app/apps/core/widgets/section_header.dart';
import 'package:doctorhunt_app/apps/features/home/data/models/doctor_models.dart';
import 'package:doctorhunt_app/apps/features/home/presentation/widget/bottom_nav_bar.dart';
import 'package:doctorhunt_app/apps/features/home/presentation/widget/category_list.dart';
import 'package:doctorhunt_app/apps/features/home/presentation/widget/feature_doctor_list.dart';
import 'package:doctorhunt_app/apps/features/home/presentation/widget/home_header.dart';
import 'package:doctorhunt_app/apps/features/home/presentation/widget/home_search_bar.dart';
import 'package:doctorhunt_app/apps/features/home/presentation/widget/live_doctor_widget.dart';
import 'package:doctorhunt_app/apps/features/home/presentation/widget/popular_doctor_list.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController =
      TextEditingController();

  int currentNavIndex = 0;

  // ============================================================
  // TEMP DATA
  // Replace these later with API response.
  // ============================================================

  final List<LiveDoctorModel> liveDoctors = const [
    LiveDoctorModel(
      name: 'Doctor 1',
      imagePath: '',
    ),
    LiveDoctorModel(
      name: 'Doctor 2',
      imagePath: '',
    ),
    LiveDoctorModel(
      name: 'Doctor 3',
      imagePath: '',
    ),
  ];

  final List<CategoryModel> categories = const [
    CategoryModel(
      title: 'Dental',
      imagePath: '',
    ),
    CategoryModel(
      title: 'Cardiology',
      imagePath: '',
    ),
    CategoryModel(
      title: 'Eye',
      imagePath: '',
    ),
    CategoryModel(
      title: 'Surgery',
      imagePath: '',
    ),
  ];

  final List<PopularDoctorModel> popularDoctors = const [
    PopularDoctorModel(
      name: 'Dr. Fillerup Grab',
      specialty: 'Medicine Specialist',
      imagePath: '',
      rating: 5,
    ),
    PopularDoctorModel(
      name: 'Dr. Blessing',
      specialty: 'Dentist Specialist',
      imagePath: '',
      rating: 5,
    ),
  ];

  final List<FeatureDoctorModel> featureDoctors = const [
    FeatureDoctorModel(
      name: 'Dr. Crick',
      imagePath: '',
      rating: 3.7,
      price: 25,
    ),
    FeatureDoctorModel(
      name: 'Dr. Strain',
      imagePath: '',
      rating: 3.0,
      price: 22,
    ),
    FeatureDoctorModel(
      name: 'Dr. Lachinet',
      imagePath: '',
      rating: 2.9,
      price: 29,
    ),
    FeatureDoctorModel(
      name: 'Dr. Doctor',
      imagePath: '',
      rating: 3.5,
      price: 24,
    ),
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                colors: [
                  Color(0xFFE8F9FF),
                  Colors.white,
                  Color(0xFFE8FFF7),
                ],
                stops: [
                  0.0,
                  0.55,
                  1.0,
                ],
              ),
            ),
          ),

          // =====================================================
          // HEADER GREEN BACKGROUND
          // =====================================================

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 156,
              decoration: const BoxDecoration(
                color: Color(0xFF08BF8A),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
            ),
          ),

          // =====================================================
          // CONTENT
          // =====================================================

          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(
                bottom: 100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeHeader(
                    userName: 'Handwerker',
                    imagePath: '',
                  ),

                  const SizedBox(height: 23),

                  HomeSearchBar(
                    controller: searchController,
                    onClear: () {
                      searchController.clear();
                    },
                  ),

                  const SizedBox(height: 30),

                  // =================================================
                  // LIVE DOCTORS
                  // =================================================

                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      'Live Doctors',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF303030),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  LiveDoctorList(
                    doctors: liveDoctors,
                  ),

                  const SizedBox(height: 30),

                  // =================================================
                  // CATEGORIES
                  // =================================================

                  CategoryList(
                    categories: categories,
                  ),

                  const SizedBox(height: 31),

                  // =================================================
                  // POPULAR DOCTORS
                  // =================================================

                  SectionHeader(
                    title: 'Popular Doctor',
                    onSeeAll: () {},
                  ),

                  const SizedBox(height: 20),

                  PopularDoctorList(
                    doctors: popularDoctors,
                  ),

                  const SizedBox(height: 30),

                  // =================================================
                  // FEATURE DOCTORS
                  // =================================================

                  SectionHeader(
                    title: 'Feature Doctor',
                    onSeeAll: () {},
                  ),

                  const SizedBox(height: 20),

                  FeatureDoctorList(
                    doctors: featureDoctors,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // =========================================================
      // BOTTOM NAV
      // =========================================================

      bottomNavigationBar: HomeBottomNavBar(
        currentIndex: currentNavIndex,
        onTap: (index) {
          setState(() {
            currentNavIndex = index;
          });
        },
      ),
    );
  }
}