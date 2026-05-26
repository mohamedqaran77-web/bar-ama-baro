import 'package:bar_ama_baro_mobile/app/app_routes.dart';
import 'package:bar_ama_baro_mobile/features/auth/data/mock_auth_repository.dart';
import 'package:bar_ama_baro_mobile/features/auth/domain/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late MockAuthRepository repository;

  setUp(() {
    repository = MockAuthRepository();
  });

  test('login returns OTP route on success', () async {
    final result = await repository.login(
      phoneOrEmail: 'arday@example.com',
      password: 'password123',
    );

    expect(result.nextRoute, AppRoutes.otp);
    expect(result.message, 'Waad ku guuleysatay galitaanka.');
  });

  test('verifyOtp rejects demo failure code', () async {
    expect(
      () => repository.verifyOtp(code: '000000'),
      throwsA(isA<AuthException>()),
    );
  });

  test('requestPasswordReset returns success message', () async {
    final result = await repository.requestPasswordReset(phoneOrEmail: '+252611234567');

    expect(result.message, 'Tilmaamaha password-ka ayaa laguu diray.');
  });
}
