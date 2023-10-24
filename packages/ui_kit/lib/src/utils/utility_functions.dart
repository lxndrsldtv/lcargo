import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void setStatusBarColorSameAsColorSchemeBackground(BuildContext ctx) {
  final theme = Theme.of(ctx);
  log('theme.brightness: ${theme.brightness} ',
      name:
          'lCargo:ui_kit:utility_functions:setStatusBarColorSameAsColorSchemeBackground');
  log('theme.colorScheme.background: ${theme.colorScheme.background} ',
      name:
          'lCargo:ui_kit:utility_functions:setStatusBarColorSameAsColorSchemeBackground');
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
