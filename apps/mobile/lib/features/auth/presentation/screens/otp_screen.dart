import 'package:flutter/material.dart';

import '../../../../core/validation/auth_validators.dart';
import '../../domain/auth_repository.dart';
import '../auth_action_state.dart';
import '../widgets/auth_page_shell.dart';
import '../widgets/auth_status_banner.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({required this.authRepository, super.key});

  final AuthRepository authRepository;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  AuthActionState _state = const AuthActionState();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _state = const AuthActionState(status: AuthActionStatus.loading));

    try {
      final result = await widget.authRepository.verifyOtp(code: _otpController.text.trim());

      if (!mounted) {
        return;
      }

      setState(() => _state = AuthActionState(status: AuthActionStatus.success, message: result.message));
    } on AuthException catch (error) {
      if (!mounted) {
        return;
      }

      setState(() => _state = AuthActionState(status: AuthActionStatus.error, message: error.message));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageShell(
      title: 'Xaqiiji OTP',
      subtitle: 'Geli 6-da lambar ee laguu soo diray.',
      children: [
        AuthStatusBanner(state: _state),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _otpController,
                decoration: const InputDecoration(
                  labelText: 'Geli OTP',
                  prefixIcon: Icon(Icons.verified_user_outlined),
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                validator: AuthValidators.otp,
              ),
              const SizedBox(height: 22),
              FilledButton(
                onPressed: _state.isLoading ? null : _submit,
                style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(52)),
                child: _state.isLoading
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Gudbi'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
