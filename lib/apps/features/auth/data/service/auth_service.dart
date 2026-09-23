import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDataSource {
  final SupabaseClient supabase;

  AuthRemoteDataSource(this.supabase);

  // ============================================================
  // SIGN UP
  // ============================================================

  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String name,
    required String role,
  }) async {
    return await supabase.auth.signUp(
      email: email,
      password: password,
      data: {'name': name, 'role': role},
    );
  }

  // ============================================================
  // LOGIN
  // ============================================================

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    return await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  // ============================================================
  // LOGOUT
  // ============================================================

  Future<void> logout() async {
    await supabase.auth.signOut();
  }

  // ============================================================
  // RESET PASSWORD EMAIL
  // ============================================================

  Future<void> sendResetPasswordEmail({
    required String email,
    required String redirectTo,
  }) async {
    await supabase.auth.resetPasswordForEmail(email, redirectTo: redirectTo);
  }

  // ============================================================
  // UPDATE PASSWORD
  // ============================================================

  Future<UserResponse> updatePassword({required String password}) async {
    return await supabase.auth.updateUser(UserAttributes(password: password));
  }

  // ============================================================
  // CURRENT USER
  // ============================================================

  User? get currentUser {
    return supabase.auth.currentUser;
  }

  // ============================================================
  // SESSION
  // ============================================================

  Session? get currentSession {
    return supabase.auth.currentSession;
  }

  // ============================================================
  // AUTH STATE
  // ============================================================

  Stream<AuthState> get authStateChanges {
    return supabase.auth.onAuthStateChange;
  }
}
