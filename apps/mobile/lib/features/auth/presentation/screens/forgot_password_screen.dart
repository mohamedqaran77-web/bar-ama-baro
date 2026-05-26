import 'package:flutter/material.dart';

import '../../../../core/validation/auth_validators.dart';
import '../../domain/auth_repository.dart';
import '../auth_action_state.dart';
import '../widgets/auth_page_shell.dart';
import '../widgets/auth_status_banner.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({required this.authRepository, super.key});

  final AuthRepository authRepository;

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneOrEmailController = TextEditingController();
  AuthActionState _state = const AuthActionState();

  @override
  void dispose() {
    _phoneOrEmailController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _state = const AuthActionState(status: AuthActionStatus.loading));

    try {
      final result = await widget.authRepository.requestPasswordReset(
        phoneOrEmail: _phoneOrEmailController.text.trim(),
      );

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
      title: 'Hilmaamay Password',
      subtitle: 'Geli email ama taleefan si aan kuugu dirno tilmaamaha.',
      children: [
        AuthStatusBanner(state: _state),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _phoneOrEmailController,
                decoration: const InputDecoration(
                  labelText: 'Geli email ama taleefan',
                  prefixIcon: Icon(Icons.contact_mail_outlined),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                validator: AuthValidators.phoneOrEmail,
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
