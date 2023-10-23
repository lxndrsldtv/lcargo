import 'package:flutter/material.dart';
import 'package:lcargo/src/widgets/lc_bottom_navigation_bar.dart';

class LCHomePage extends StatelessWidget {
  const LCHomePage({super.key});

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
