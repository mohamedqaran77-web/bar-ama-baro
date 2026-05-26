import '../../../app/app_routes.dart';
import '../domain/auth_repository.dart';

class MockAuthRepository implements AuthRepository {
  static const _delay = Duration(milliseconds: 350);

  @override
  Future<AuthResult> login({
    required String phoneOrEmail,
    required String password,
  }) async {
    await Future<void>.delayed(_delay);
    _throwForDemoErrors(phoneOrEmail);

    return const AuthResult(
      message: 'Waad ku guuleysatay galitaanka.',
      nextRoute: AppRoutes.otp,
    );
  }

  @override
  Future<AuthResult> register({
    required String fullName,
    required String phoneOrEmail,
    required String password,
  }) async {
    await Future<void>.delayed(_delay);
    _throwForDemoErrors(phoneOrEmail);

    return const AuthResult(
      message: 'Akoonka waa la abuuray. Xaqiiji OTP.',
      nextRoute: AppRoutes.otp,
    );
  }

  @override
  Future<AuthResult> verifyOtp({required String code}) async {
    await Future<void>.delayed(_delay);

    if (code == '000000') {
      throw const AuthException('OTP sax ma aha. Isku day mar kale.');
    }

    return const AuthResult(message: 'OTP waa la xaqiijiyay.');
  }

  @override
  Future<AuthResult> requestPasswordReset({required String phoneOrEmail}) async {
    await Future<void>.delayed(_delay);
    _throwForDemoErrors(phoneOrEmail);

    return const AuthResult(message: 'Tilmaamaha password-ka ayaa laguu diray.');
  }

  void _throwForDemoErrors(String value) {
    if (value.toLowerCase().contains('error')) {
      throw const AuthException('Codsiga lama dhammeystirin. Isku day mar kale.');
    }
  }
}
