class AuthValidators {
  const AuthValidators._();

  static final RegExp _emailPattern = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
  static final RegExp _phonePattern = RegExp(r'^\+?[0-9]{7,15}$');

  static String? requiredText(String? value, {String fieldName = 'Goobtan'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName waa qasab.';
    }

    return null;
  }

  static String? fullName(String? value) {
    final requiredError = requiredText(value, fieldName: 'Magaca buuxa');
    if (requiredError != null) {
      return requiredError;
    }

    if (value!.trim().split(RegExp(r'\s+')).length < 2) {
      return 'Geli magacaaga oo buuxa.';
    }

    return null;
  }

  static String? phoneOrEmail(String? value) {
    final requiredError = requiredText(value, fieldName: 'Teleefan ama email');
    if (requiredError != null) {
      return requiredError;
    }

    final normalizedValue = value!.trim();
    final isEmail = _emailPattern.hasMatch(normalizedValue);
    final isPhone = _phonePattern.hasMatch(normalizedValue.replaceAll(' ', ''));

    if (!isEmail && !isPhone) {
      return 'Geli email sax ah ama lambarka taleefanka.';
    }

    return null;
  }

  static String? password(String? value) {
    final requiredError = requiredText(value, fieldName: 'Password');
    if (requiredError != null) {
      return requiredError;
    }

    if (value!.length < 8) {
      return 'Password-ku waa inuu ahaadaa ugu yaraan 8 xaraf.';
    }

    return null;
  }

  static String? otp(String? value) {
    final requiredError = requiredText(value, fieldName: 'OTP');
    if (requiredError != null) {
      return requiredError;
    }

    if (!RegExp(r'^[0-9]{6}$').hasMatch(value!.trim())) {
      return 'Geli OTP ka kooban 6 lambar.';
    }

    return null;
  }
}
