import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:lcargo/src/widgets/lc_page.dart';
import 'package:lcargo/src/widgets/lc_bottom_navigation_bar.dart';
import 'package:ui_kit/ui_kit.dart';

class LCHomePage extends StatelessWidget {
  const LCHomePage({super.key, required this.navShell});

  final StatefulNavigationShell navShell;

  @override
  Widget build(BuildContext context) {
    log('LCHomePage build', name: 'lCargo');
    setStatusBarColorSameAsColorSchemeBackground(context);

    return Scaffold(
      body: navShell,
      bottomNavigationBar: LCBottomNavigationBar(
        index: navShell.currentIndex,
        onTap: (index) {
          navShell.goBranch(index);
        },
      ),
    );
  }
}
