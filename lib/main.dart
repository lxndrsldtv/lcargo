import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lcargo/src/widgets/lc_bottom_navigation_bar.dart';

void main() {
  runApp(const LCargoApp());
}

class LCargoApp extends StatelessWidget {
  const LCargoApp({super.key});

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
      routerConfig: GoRouter(
        routes: [
          GoRoute(path: '/', builder: (ctx, st) => const LCargoHomePage()),
        ]
      ),
    );
  }
}

class LCargoHomePage extends StatelessWidget {
  const LCargoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Placeholder(),
      ),
      bottomNavigationBar: LCBottomNavigationBar(),
    );
  }
}
