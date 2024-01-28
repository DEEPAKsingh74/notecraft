import 'package:go_router/go_router.dart';
import 'package:notecraft/screens/auth/login/login_screen.dart';
import 'package:notecraft/screens/auth/register/register_screen.dart';
import 'package:notecraft/screens/edit/edit_screen.dart';
import 'package:notecraft/screens/home/bottom_navigation.dart';
import 'package:notecraft/screens/onboard/onboard_screen.dart';
import 'package:notecraft/screens/splash/splash_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboard',
      builder: (context, state) => const OnboardScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const BottomNav(),
    ),
    GoRoute(
      path: '/edit_note',
      builder: (context, state) => const EditScreen(),
    ),
  ],
);
