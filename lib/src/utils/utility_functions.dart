import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void setStatusBarColorSameAsColorSchemeBackground(BuildContext ctx) {
  final theme = Theme.of(ctx);
  theme.brightness == Brightness.light
      ? SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: theme.colorScheme.background,
          ),
        )
      : SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light.copyWith(
            statusBarColor: theme.colorScheme.background,
          ),
        );
}
