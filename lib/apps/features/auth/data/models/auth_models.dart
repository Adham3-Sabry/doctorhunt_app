import 'package:supabase_flutter/supabase_flutter.dart';

class AuthUserModel {
  final String id;
  final String email;
  final String? name;
  final String? role;

  const AuthUserModel({
    required this.id,
    required this.email,
    this.name,
    this.role,
  });

  factory AuthUserModel.fromSupabaseUser(User user) {
    return AuthUserModel(
      id: user.id,
      email: user.email ?? '',
      name: user.userMetadata?['name'] as String?,
      role: user.userMetadata?['role'] as String?,
    );
  }
}