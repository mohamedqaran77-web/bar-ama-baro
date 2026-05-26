import 'package:flutter/material.dart';

import '../auth_action_state.dart';

class AuthStatusBanner extends StatelessWidget {
  const AuthStatusBanner({required this.state, super.key});

  final AuthActionState state;

  @override
  Widget build(BuildContext context) {
    if (state.status == AuthActionStatus.idle || state.status == AuthActionStatus.loading) {
      return const SizedBox.shrink();
    }

    final isError = state.status == AuthActionStatus.error;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isError ? colorScheme.errorContainer : colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Icon(
            isError ? Icons.error_outline : Icons.check_circle_outline,
            color: isError ? colorScheme.onErrorContainer : colorScheme.onPrimaryContainer,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              state.message ?? '',
              style: TextStyle(
                color: isError ? colorScheme.onErrorContainer : colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
