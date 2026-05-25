import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/providers/providers.dart';
import 'core/services/notification_service.dart';
import 'core/theme/app_theme.dart';
import 'firebase_options.dart';
import 'router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final prefs = await SharedPreferences.getInstance();

  await NotificationService.init();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarContrastEnforced: false,
  ));

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const EwsApp(),
    ),
  );
}

class EwsApp extends ConsumerWidget {
  const EwsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return ShadApp.router(
      title: 'EWS Landslide Monitor',
      theme: AppTheme.shad,
      darkTheme: AppTheme.shadDark,
      routerConfig: router,
      builder: (context, child) => SafeArea(
        top: false,
        child: child!,
      ),
    );
  }
}
