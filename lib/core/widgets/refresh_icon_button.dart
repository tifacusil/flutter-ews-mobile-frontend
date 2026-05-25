import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// A refresh icon button that shows a spinning [CircularProgressIndicator]
/// while [isLoading] is true and disables taps during that time.
class RefreshIconButton extends StatelessWidget {
  const RefreshIconButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
    this.size = 18,
  });

  final bool isLoading;
  final VoidCallback onPressed;

  /// Icon / spinner size in logical pixels.
  final double size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Refresh',
      visualDensity: VisualDensity.compact,
      onPressed: isLoading ? null : onPressed,
      icon: isLoading
          ? SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: ShadTheme.of(context).colorScheme.mutedForeground,
              ),
            )
          : Icon(LucideIcons.refreshCw, size: size),
    );
  }
}
