import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            LucideIcons.triangleAlert,
            size: 36,
            color: theme.colorScheme.primaryForeground,
          ),
        ),
        const SizedBox(height: 16),
        Text('EWS Monitor', style: theme.textTheme.h2),
        const SizedBox(height: 4),
        Text(
          'Landslide Early Warning System',
          style: theme.textTheme.muted,
        ),
      ],
    );
  }
}
