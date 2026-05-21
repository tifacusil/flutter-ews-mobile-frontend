import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AppTheme {
  const AppTheme._();

  // Slate gives neutral UI so alert colours (blue/orange/red) stand out clearly.
  static ShadThemeData get shad => ShadThemeData(
        brightness: Brightness.light,
        colorScheme: const ShadSlateColorScheme.light(),
      );

  static ShadThemeData get shadDark => ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadSlateColorScheme.dark(),
      );
}
