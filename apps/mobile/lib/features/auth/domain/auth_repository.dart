abstract interface class AuthRepository {
  Future<AuthResult> login({
    required String phoneOrEmail,
    required String password,
  });

  Future<AuthResult> register({
    required String fullName,
    required String phoneOrEmail,
    required String password,
  });

  Future<AuthResult> verifyOtp({
    required String code,
  });

  Future<AuthResult> requestPasswordReset({
    required String phoneOrEmail,
  });
}

class AuthResult {
  const AuthResult({
    required this.message,
    this.nextRoute,
  });

  final String message;
  final String? nextRoute;
}

class AuthException implements Exception {
  const AuthException(this.message);

  final String message;

  @override
  String toString() => message;
}
