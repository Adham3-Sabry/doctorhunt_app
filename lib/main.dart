import 'package:doctorhunt_app/apps/main/app.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://xvfbdbptucofajzwccjg.supabase.co',
    anonKey: 'sb_publishable_hYT78rSC8OuqO6rzoaH8dA_WVoEfYb_',
  );

  runApp(
    const DoctorHuntApp(),
  );
}