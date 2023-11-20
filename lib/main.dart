import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lcargo/firebase_options.dart';
import 'package:lcargo/lc_router.dart';
import 'package:lcargo/lc_theme.dart';
import 'package:lcargo/src/l10n/app_localizations.dart';
import 'package:lcargo/src/services/lc_notification_service.dart';
import 'package:order_service/order_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // for now firebase configured for android platform only
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final token = await FirebaseMessaging.instance.getToken();
    print('token: $token');
  }

  final lcNotificationService = LCNotificationService();
  await Future.delayed(const Duration(seconds: 1));
  lcNotificationService.displayLocalNotification();

  runApp(LCApp(
    lcRouter: LCRouter(),
  ));
}

class LCApp extends StatelessWidget {
  const LCApp({super.key, required this.lcRouter});

  final LCRouter lcRouter;

  @override
  Widget build(BuildContext context) {
    log('build', name: 'lCargo:LCApp');

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
      // locale: const Locale('ru'),
      routerConfig: lcRouter.lcRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
