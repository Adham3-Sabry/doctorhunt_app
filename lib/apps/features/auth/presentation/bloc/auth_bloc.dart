import 'dart:async';
import 'package:doctorhunt_app/apps/core/utils/auth_error_handler.dart';
import 'package:doctorhunt_app/apps/features/auth/data/models/auth_models.dart';
import 'package:doctorhunt_app/apps/features/auth/data/repo/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  StreamSubscription<supabase.AuthState>? _authSubscription;

  AuthBloc({
    required this.authRepository,
  }) : super(const AuthState()) {
    on<AuthStarted>(_onAuthStarted);
    on<AuthSignUpRequested>(_onSignUp);
    on<AuthLoginRequested>(_onLogin);
    on<AuthLogoutRequested>(_onLogout);
    on<AuthForgotPasswordRequested>(_onForgotPassword);
    on<AuthUpdatePasswordRequested>(_onUpdatePassword);

    _listenToAuthChanges();
  }

  void _listenToAuthChanges() {
    _authSubscription =
        authRepository.authStateChanges.listen((_) {
      add(const AuthStarted());
    });
  }

  // =========================
  // AUTH STARTED
  // =========================

  Future<void> _onAuthStarted(
    AuthStarted event,
    Emitter<AuthState> emit,
  ) async {
    final supabaseUser = authRepository.currentUser;

    if (supabaseUser != null) {
      final user = AuthUserModel.fromSupabaseUser(
        supabaseUser,
      );

      emit(
        AuthState(
          status: AuthStatus.authenticated,
          user: user,
        ),
      );
    } else {
      emit(
        const AuthState(
          status: AuthStatus.unauthenticated,
        ),
      );
    }
  }

  // =========================
  // SIGN UP
  // =========================

  Future<void> _onSignUp(
    AuthSignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      const AuthState(
        status: AuthStatus.loading,
      ),
    );

    try {
      final response = await authRepository.signUp(
        name: event.name,
        email: event.email,
        password: event.password,
        role: event.role,
      );

      if (response.user == null) {
        emit(
          const AuthState(
            status: AuthStatus.failure,
            errorMessage: 'Unable to create account.',
          ),
        );
        return;
      }

      final user = AuthUserModel.fromSupabaseUser(
        response.user!,
      );

      final currentSession =
          authRepository.currentSession;

      // Email confirmation OFF
      if (currentSession != null) {
        emit(
          AuthState(
            status: AuthStatus.authenticated,
            user: user,
          ),
        );
        return;
      }

      // Email confirmation ON
      emit(
        AuthState(
          status: AuthStatus.success,
          user: user,
        ),
      );
    } catch (error) {
      emit(
        AuthState(
          status: AuthStatus.failure,
          errorMessage: AuthErrorHandler.getMessage(error),
        ),
      );
    }
  }

  // =========================
  // LOGIN
  // =========================

  Future<void> _onLogin(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      const AuthState(
        status: AuthStatus.loading,
      ),
    );

    try {
      final response = await authRepository.login(
        email: event.email,
        password: event.password,
      );

      if (response.user == null) {
        emit(
          const AuthState(
            status: AuthStatus.failure,
            errorMessage: 'Unable to login.',
          ),
        );
        return;
      }

      final user = AuthUserModel.fromSupabaseUser(
        response.user!,
      );

      emit(
        AuthState(
          status: AuthStatus.authenticated,
          user: user,
        ),
      );
    } catch (error) {
      emit(
        AuthState(
          status: AuthStatus.failure,
          errorMessage: AuthErrorHandler.getMessage(error),
        ),
      );
    }
  }

  // =========================
  // LOGOUT
  // =========================

  Future<void> _onLogout(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      const AuthState(
        status: AuthStatus.loading,
      ),
    );

    try {
      await authRepository.logout();

      emit(
        const AuthState(
          status: AuthStatus.unauthenticated,
        ),
      );
    } catch (error) {
      emit(
        AuthState(
          status: AuthStatus.failure,
          errorMessage: AuthErrorHandler.getMessage(error),
        ),
      );
    }
  }

  // =========================
  // FORGOT PASSWORD
  // =========================

  Future<void> _onForgotPassword(
    AuthForgotPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      const AuthState(
        status: AuthStatus.loading,
      ),
    );

    try {
      await authRepository.sendResetPasswordEmail(
        email: event.email,
        redirectTo: '',
      );

      emit(
        const AuthState(
          status: AuthStatus.success,
        ),
      );
    } catch (error) {
      emit(
        AuthState(
          status: AuthStatus.failure,
          errorMessage: AuthErrorHandler.getMessage(error),
        ),
      );
    }
  }

  // =========================
  // UPDATE PASSWORD
  // =========================

  Future<void> _onUpdatePassword(
    AuthUpdatePasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      const AuthState(
        status: AuthStatus.loading,
      ),
    );

    try {
      await authRepository.updatePassword(
        password: event.password,
      );

      final supabaseUser =
          authRepository.currentUser;

      if (supabaseUser == null) {
        emit(
          const AuthState(
            status: AuthStatus.failure,
            errorMessage: 'Unable to update password.',
          ),
        );
        return;
      }

      final user = AuthUserModel.fromSupabaseUser(
        supabaseUser,
      );

      emit(
        AuthState(
          status: AuthStatus.success,
          user: user,
        ),
      );
    } catch (error) {
      emit(
        AuthState(
          status: AuthStatus.failure,
          errorMessage: AuthErrorHandler.getMessage(error),
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    await _authSubscription?.cancel();
    return super.close();
  }
}