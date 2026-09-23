import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthStarted extends AuthEvent {
  const AuthStarted();
}

class AuthSignUpRequested extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String role;

  const AuthSignUpRequested({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        role,
      ];
}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  const AuthLoginRequested({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}

class AuthLogoutRequested extends AuthEvent {
  const AuthLogoutRequested();
}

class AuthForgotPasswordRequested extends AuthEvent {
  final String email;

  const AuthForgotPasswordRequested({
    required this.email,
  });

  @override
  List<Object?> get props => [email];
}

class AuthUpdatePasswordRequested extends AuthEvent {
  final String password;

  const AuthUpdatePasswordRequested({
    required this.password,
  });

  @override
  List<Object?> get props => [password];
}