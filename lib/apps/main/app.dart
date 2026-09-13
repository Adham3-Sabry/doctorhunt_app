import 'package:flutter/material.dart';

import '../core/router/app_router.dart';

class DoctorHuntApp extends StatelessWidget {
  const DoctorHuntApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Doctor Hunt App',

      theme: ThemeData(
        fontFamily: 'Rubik',
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),

      routerConfig: AppRouter.router,
    );
  }
}