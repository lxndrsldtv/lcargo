import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lcargo/lc_home_page.dart';
import 'package:lcargo/lc_router.dart';
import 'package:lcargo/lc_theme.dart';

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
      routerConfig: lcRouter.lcRouter,
      //  GoRouter(routes: [
      //   GoRoute(path: '/', builder: (ctx, st) => const LCHomePage()),
      // ]),
    );
  }
}
