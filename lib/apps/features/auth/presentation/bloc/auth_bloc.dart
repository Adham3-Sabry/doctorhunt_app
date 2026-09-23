import 'dart:async';

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
    _authSubscription = supabase
        .Supabase
        .instance
        .client
        .auth
        .onAuthStateChange
        .listen((_) {
      add(const AuthStarted());
    });
  }

  Future<void> _onAuthStarted(
    AuthStarted event,
    Emitter<AuthState> emit,
  ) async {
    final user = authRepository.currentUser;

    if (user != null) {
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
      final user = await authRepository.signUp(
        name: event.name,
        email: event.email,
        password: event.password,
        role: event.role,
      );

      final currentUser = authRepository.currentUser;

      if (currentUser != null) {
        emit(
          AuthState(
            status: AuthStatus.authenticated,
            user: currentUser,
          ),
        );
      } else {
        emit(
          AuthState(
            status: AuthStatus.success,
            user: user,
          ),
        );
      }
    } on supabase.AuthException catch (e) {
      emit(
        AuthState(
          status: AuthStatus.failure,
          errorMessage: e.message,
        ),
      );
    } catch (e) {
      emit(
        AuthState(
          status: AuthStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

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
      await authRepository.login(
        email: event.email,
        password: event.password,
      );

      final currentUser = authRepository.currentUser;

      emit(
        AuthState(
          status: AuthStatus.authenticated,
          user: currentUser,
        ),
      );
    } on supabase.AuthException catch (e) {
      emit(
        AuthState(
          status: AuthStatus.failure,
          errorMessage: e.message,
        ),
      );
    } catch (e) {
      emit(
        AuthState(
          status: AuthStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

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
    } on supabase.AuthException catch (e) {
      emit(
        AuthState(
          status: AuthStatus.failure,
          errorMessage: e.message,
        ),
      );
    } catch (e) {
      emit(
        AuthState(
          status: AuthStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

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
      );

      emit(
        const AuthState(
          status: AuthStatus.success,
        ),
      );
    } on supabase.AuthException catch (e) {
      emit(
        AuthState(
          status: AuthStatus.failure,
          errorMessage: e.message,
        ),
      );
    } catch (e) {
      emit(
        AuthState(
          status: AuthStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

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

      final user = authRepository.currentUser;

      emit(
        AuthState(
          status: AuthStatus.success,
          user: user,
        ),
      );
    } on supabase.AuthException catch (e) {
      emit(
        AuthState(
          status: AuthStatus.failure,
          errorMessage: e.message,
        ),
      );
    } catch (e) {
      emit(
        AuthState(
          status: AuthStatus.failure,
          errorMessage: e.toString(),
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