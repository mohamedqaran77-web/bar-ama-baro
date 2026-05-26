enum AuthActionStatus { idle, loading, success, error }

class AuthActionState {
  const AuthActionState({
    this.status = AuthActionStatus.idle,
    this.message,
  });

  final AuthActionStatus status;
  final String? message;

  bool get isLoading => status == AuthActionStatus.loading;
}
