import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
  });

  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ShadButton(
      width: double.infinity,
      onPressed: isLoading ? null : onPressed,
      leading: isLoading
          ? SizedBox.square(
              dimension: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: theme.colorScheme.primaryForeground,
              ),
            )
          : null,
      child: Text(isLoading ? 'Signing in…' : 'Sign in'),
    );
  }
}
