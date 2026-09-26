import 'package:doctorhunt_app/apps/features/auth/data/repo/auth_repository.dart';
import 'package:doctorhunt_app/apps/features/auth/data/service/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String name,
    required String role,
  }) async {
    return await remoteDataSource.signUp(
      email: email,
      password: password,
      name: name,
      role: role,
    );
  }

  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    return await remoteDataSource.login(email: email, password: password);
  }

  @override
  Future<void> logout() async {
    await remoteDataSource.logout();
  }

  @override
  Future<void> sendResetPasswordEmail({
    required String email,
    required String redirectTo,
  }) async {
    await remoteDataSource.sendResetPasswordEmail(
      email: email,
      redirectTo: redirectTo,
    );
  }

  @override
  Future<UserResponse> updatePassword({required String password}) async {
    return await remoteDataSource.updatePassword(password: password);
  }

  @override
  User? get currentUser {
    return remoteDataSource.currentUser;
  }

  @override
  Session? get currentSession {
    return remoteDataSource.currentSession;
  }

  @override
  Stream<AuthState> get authStateChanges {
    return remoteDataSource.authStateChanges;
  }
}
