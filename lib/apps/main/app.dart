import 'package:doctorhunt_app/apps/features/auth/data/repo/auth_repository_impl.dart';
import 'package:doctorhunt_app/apps/features/auth/data/service/auth_service.dart';
import 'package:doctorhunt_app/apps/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctorhunt_app/apps/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/router/app_router.dart';

class DoctorHuntApp extends StatelessWidget {
  const DoctorHuntApp({super.key});

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;

    final remoteDataSource = AuthRemoteDataSource(supabase);

    final authRepository = AuthRepositoryImpl(remoteDataSource);

    return BlocProvider(
      create: (_) =>
          AuthBloc(authRepository: authRepository)..add(const AuthStarted()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
