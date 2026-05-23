import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'core/services/notification_service.dart';
import 'core/theme/app_theme.dart';
import 'router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService.init();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarContrastEnforced: false,
  ));
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
      builder: (context, child) => SafeArea(
        top: false,
        child: child!,
      ),
    );
  }
}
