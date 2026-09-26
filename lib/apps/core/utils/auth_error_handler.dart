import 'package:supabase_flutter/supabase_flutter.dart';

class AuthErrorHandler {
  static String getMessage(Object error) {
    if (error is AuthException) {
      return _handleAuthException(error);
    }

    return 'Something went wrong. Please try again.';
  }

  static String _handleAuthException(AuthException error) {
    final message = error.message.toLowerCase();

    if (message.contains('invalid login credentials')) {
      return 'Email or password is incorrect.';
    }

    if (message.contains('user already registered') ||
        message.contains('already registered')) {
      return 'This email is already registered.';
    }

    if (message.contains('email not confirmed')) {
      return 'Please confirm your email before logging in.';
    }

    if (message.contains('invalid email')) {
      return 'Please enter a valid email address.';
    }

    if (message.contains('password should be at least')) {
      return 'Password must be at least 6 characters.';
    }

    if (message.contains('weak password')) {
      return 'Please choose a stronger password.';
    }

    if (message.contains('rate limit')) {
      return 'Too many requests. Please try again later.';
    }

    if (message.contains('network')) {
      return 'Network error. Please check your connection.';
    }

    return error.message;
  }
}