import 'package:flutter/material.dart';
import 'package:lcargo/src/widgets/lc_bottom_navigation_bar.dart';

void main() {
  runApp(const LCBottomNavigationBarDemo());
}

class LCBottomNavigationBarDemo extends StatefulWidget {
  const LCBottomNavigationBarDemo({super.key});

  @override
  State<LCBottomNavigationBarDemo> createState() =>
      _LCBottomNavigationBarDemoState();
}

class _LCBottomNavigationBarDemoState extends State<LCBottomNavigationBarDemo> {
  bool colorSchemeLight = true;

  _switchThemeMode(bool themeLight) {
    setState(() {
      colorSchemeLight = themeLight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lCargo Bottom Navigation Bar Demo',
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
      themeMode: colorSchemeLight ? ThemeMode.light : ThemeMode.dark,
      home: LCBottomNavigationBarDemoHomePage(
        title: 'Bottom Navigation Bar Demo',
        isThemeLight: colorSchemeLight,
        switchThemeMode: _switchThemeMode,
      ),
    );
  }
}

class LCBottomNavigationBarDemoHomePage extends StatefulWidget {
  const LCBottomNavigationBarDemoHomePage(
      {super.key,
      required this.title,
      required this.isThemeLight,
      required this.switchThemeMode});

  final String title;
  final bool isThemeLight;
  final void Function(bool) switchThemeMode;

  @override
  State<LCBottomNavigationBarDemoHomePage> createState() =>
      _LCBottomNavigationBarDemoHomePageState();
}

class _LCBottomNavigationBarDemoHomePageState
    extends State<LCBottomNavigationBarDemoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(value: widget.isThemeLight, onChanged: widget.switchThemeMode),
        ],
      ),
      body: const Placeholder(),
      bottomNavigationBar: const LCBottomNavigationBar(),
      // floatingActionButton: FloatingActionButton(onPressed: _changeTheme),
    );
  }
}
