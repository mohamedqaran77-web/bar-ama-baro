import 'package:bar_ama_baro_mobile/core/validation/auth_validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthValidators.phoneOrEmail', () {
    test('accepts valid email', () {
      expect(AuthValidators.phoneOrEmail('arday@example.com'), isNull);
    });

    test('accepts valid phone number', () {
      expect(AuthValidators.phoneOrEmail('+252611234567'), isNull);
    });

    test('rejects invalid value with Somali error', () {
      expect(
        AuthValidators.phoneOrEmail('qaldan'),
        'Geli email sax ah ama lambarka taleefanka.',
      );
    });
  });

  group('AuthValidators.password', () {
    test('requires at least 8 characters', () {
      expect(
        AuthValidators.password('1234567'),
        'Password-ku waa inuu ahaadaa ugu yaraan 8 xaraf.',
      );
    });

    test('accepts strong enough password', () {
      expect(AuthValidators.password('password123'), isNull);
    });
  });

  group('AuthValidators.otp', () {
    test('requires 6 digits', () {
      expect(AuthValidators.otp('123'), 'Geli OTP ka kooban 6 lambar.');
    });

    test('accepts 6 digit code', () {
      expect(AuthValidators.otp('123456'), isNull);
    });
  });

  group('AuthValidators.fullName', () {
    test('requires full name', () {
      expect(AuthValidators.fullName('Ayaan'), 'Geli magacaaga oo buuxa.');
    });

    test('accepts two-part name', () {
      expect(AuthValidators.fullName('Ayaan Ali'), isNull);
    });
  });
}
