import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String name,
    required String role,
  });

  Future<AuthResponse> login({
    required String email,
    required String password,
  });

  Future<void> logout();

  Future<void> sendResetPasswordEmail({
    required String email,
    required String redirectTo,
  });

  Future<UserResponse> updatePassword({
    required String password,
  });

  User? get currentUser;

  Session? get currentSession;

  Stream<AuthState> get authStateChanges;
}