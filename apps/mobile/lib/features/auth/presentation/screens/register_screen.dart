import 'package:flutter/material.dart';

import '../../../../app/app_routes.dart';
import '../../../../core/validation/auth_validators.dart';
import '../../domain/auth_repository.dart';
import '../auth_action_state.dart';
import '../widgets/auth_page_shell.dart';
import '../widgets/auth_status_banner.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({required this.authRepository, super.key});

  final AuthRepository authRepository;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _phoneOrEmailController = TextEditingController();
  final _passwordController = TextEditingController();
  AuthActionState _state = const AuthActionState();

  @override
  void dispose() {
    _fullNameController.dispose();
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
      final result = await widget.authRepository.register(
        fullName: _fullNameController.text.trim(),
        phoneOrEmail: _phoneOrEmailController.text.trim(),
        password: _passwordController.text,
      );

      if (!mounted) {
        return;
      }

      setState(() => _state = AuthActionState(status: AuthActionStatus.success, message: result.message));
      Navigator.of(context).pushNamed(result.nextRoute ?? AppRoutes.otp);
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
      title: 'Isdiiwaan Geli',
      subtitle: 'Samee akoon si aad u bilowdo barashada.',
      children: [
        AuthStatusBanner(state: _state),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  labelText: 'Magaca buuxa',
                  prefixIcon: Icon(Icons.badge_outlined),
                ),
                textInputAction: TextInputAction.next,
                validator: AuthValidators.fullName,
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _phoneOrEmailController,
                decoration: const InputDecoration(
                  labelText: 'Geli email ama taleefan',
                  prefixIcon: Icon(Icons.alternate_email),
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
                    : const Text('Isdiiwaan Geli'),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: _state.isLoading ? null : () => Navigator.of(context).pushReplacementNamed(AppRoutes.login),
                child: const Text('Akoon hore ma leedahay? Gal Akoonka'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
