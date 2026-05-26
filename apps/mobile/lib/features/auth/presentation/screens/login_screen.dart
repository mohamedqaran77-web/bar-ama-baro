import 'package:flutter/material.dart';

import '../../../../app/app_routes.dart';
import '../../../../core/validation/auth_validators.dart';
import '../../domain/auth_repository.dart';
import '../auth_action_state.dart';
import '../widgets/auth_page_shell.dart';
import '../widgets/auth_status_banner.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({required this.authRepository, super.key});

  final AuthRepository authRepository;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneOrEmailController = TextEditingController();
  final _passwordController = TextEditingController();
  AuthActionState _state = const AuthActionState();

  @override
  void dispose() {
    _phoneOrEmailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _state = const AuthActionState(status: AuthActionStatus.loading));

    try {
      final result = await widget.authRepository.login(
        phoneOrEmail: _phoneOrEmailController.text.trim(),
        password: _passwordController.text,
      );

      if (!mounted) {
        return;
      }

      setState(() => _state = AuthActionState(status: AuthActionStatus.success, message: result.message));

      if (result.nextRoute != null) {
        Navigator.of(context).pushNamed(result.nextRoute!);
      }
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
      title: 'Gal Akoonka',
      subtitle: 'Geli email ama lambarka taleefanka si aad u sii wadato.',
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
                  prefixIcon: Icon(Icons.person_outline),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: AuthValidators.phoneOrEmail,
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Geli password',
                  prefixIcon: Icon(Icons.lock_outline),
                ),
                obscureText: true,
                textInputAction: TextInputAction.done,
                validator: AuthValidators.password,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _state.isLoading ? null : () => Navigator.of(context).pushNamed(AppRoutes.forgotPassword),
                  child: const Text('Hilmaamay Password'),
                ),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: _state.isLoading ? null : _submit,
                style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(52)),
                child: _state.isLoading
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Gal Akoonka'),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: _state.isLoading ? null : () => Navigator.of(context).pushReplacementNamed(AppRoutes.register),
                child: const Text('Akoon ma lihid? Isdiiwaan Geli'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
