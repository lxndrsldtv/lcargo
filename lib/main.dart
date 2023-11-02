import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lcargo/lc_router.dart';
import 'package:lcargo/lc_theme.dart';
import 'package:lcargo/src/l10n/app_localizations.dart';
import 'package:order_service/order_service.dart';

void main() {
  runApp(LCApp(
    lcRouter: LCRouter(),
  ));
}

class LCApp extends StatelessWidget {
  const LCApp({super.key, required this.lcRouter});

  final LCRouter lcRouter;

  @override
  Widget build(BuildContext context) {
    log('LCApp build', name: 'lCargo');

    return MaterialApp.router(
      title: 'LCargo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(),
        bottomNavigationBarTheme: const LCBottomNavigationBarThemeData.light(),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(),
        bottomNavigationBarTheme: const LCBottomNavigationBarThemeData.dark2(),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        OrderServiceLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        ...AppLocalizations.supportedLocales,
        ...OrderServiceLocalizations.supportedLocales,
      ],
      locale: const Locale('ru'),
      routerConfig: lcRouter.lcRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
