import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'core/theme/app_theme.dart';
import 'router.dart';

void main() {
  runApp(
    const ProviderScope(
      child: EwsApp(),
    ),
  );
}

class EwsApp extends StatelessWidget {
  const EwsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.router(
      title: 'EWS Landslide Monitor',
      theme: AppTheme.shad,
      darkTheme: AppTheme.shadDark,
      routerConfig: appRouter,
    );
  }
}
