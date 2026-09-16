
import 'package:doctorhunt_app/apps/features/auth/presentation/screens/login_screen.dart';
import 'package:doctorhunt_app/apps/features/auth/presentation/screens/signup_screen.dart';
import 'package:doctorhunt_app/apps/features/home/presentation/screen/home_screen.dart';
import 'package:doctorhunt_app/apps/features/onboarding/screens/choose_role.dart';
import 'package:doctorhunt_app/apps/features/onboarding/screens/onboard1.dart';
import 'package:doctorhunt_app/apps/features/onboarding/screens/onboard2.dart';
import 'package:doctorhunt_app/apps/features/onboarding/screens/onboard3.dart';
import 'package:doctorhunt_app/apps/features/onboarding/screens/splash.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String splash = '/';

  static const String onboarding1 = '/onboarding-1';
  static const String onboarding2 = '/onboarding-2';
  static const String onboarding3 = '/onboarding-3';
  static const String chooseRole = '/choose-role';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';




  static final GoRouter router = GoRouter(
    initialLocation: splash,

    routes: [
      // =========================
      // SPLASH
      // =========================
      GoRoute(
        path: splash,
        name: 'splash',
        builder: (context, state) {
          return const SplashScreen();
        },
      ),

      // =========================
      // ONBOARDING 1
      // =========================
      GoRoute(
        path: onboarding1,
        name: 'onboarding1',
        builder: (context, state) {
          return const OnboardingScreen1();
        },
      ),

      // =========================
      // ONBOARDING 2
      // =========================
      GoRoute(
        path: onboarding2,
        name: 'onboarding2',
        builder: (context, state) {
          return const OnboardingScreen2();
        },
      ),

      // =========================
      // ONBOARDING 3
      // =========================
      GoRoute(
        path: onboarding3,
        name: 'onboarding3',
        builder: (context, state) {
          return const OnboardingScreen3();
        },
      ),
       GoRoute(
        path: chooseRole,
        name: 'chooseRole',
        builder: (context, state) {
          return const ChooseRoleScreen();
        },
      ),
      GoRoute(
        path: login,
        name: 'login',
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
       GoRoute(
        path: signup,
        name: 'signup',
        builder: (context, state) {
          return const SignupScreen();
        },
      ),
     
      GoRoute(
        path: home,
        name: 'home',
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
    ],
  );
}