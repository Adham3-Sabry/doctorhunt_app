import 'package:doctorhunt_app/apps/features/auth/data/models/auth_models.dart';


enum AuthStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
  success,
  failure,
}

class AuthState {
  final AuthStatus status;
  final AuthUserModel? user;
  final String? errorMessage;

  const AuthState({
    this.status = AuthStatus.initial,
    this.user,
    this.errorMessage,
  });

  AuthState copyWith({
    AuthStatus? status,
    AuthUserModel? user,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}