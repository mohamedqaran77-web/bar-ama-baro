import 'package:flutter/material.dart';

import '../features/auth/data/mock_auth_repository.dart';
import '../features/auth/domain/auth_repository.dart';
import '../features/auth/presentation/screens/forgot_password_screen.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/onboarding_screen.dart';
import '../features/auth/presentation/screens/otp_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';
import 'app_routes.dart';

class BarAmaBaroApp extends StatelessWidget {
  const BarAmaBaroApp({super.key, AuthRepository? authRepository})
      : _authRepository = authRepository;

  final AuthRepository? _authRepository;

  @override
  Widget build(BuildContext context) {
    final authRepository = _authRepository ?? MockAuthRepository();

    return MaterialApp(
      title: 'Bar ama Baro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF146C5F),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (_) => const SplashScreen(),
        AppRoutes.onboarding: (_) => const OnboardingScreen(),
        AppRoutes.login: (_) => LoginScreen(authRepository: authRepository),
        AppRoutes.register: (_) => RegisterScreen(authRepository: authRepository),
        AppRoutes.otp: (_) => OtpScreen(authRepository: authRepository),
        AppRoutes.forgotPassword: (_) => ForgotPasswordScreen(authRepository: authRepository),
      },
    );
  }
}
