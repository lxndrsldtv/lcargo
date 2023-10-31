import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class LCPage extends StatelessWidget {
  const LCPage({
    super.key,
    required this.title,
    this.body,
    // this.bottomNavigationBar
  });

  final String title;
  final Widget? body;
  // final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            LCPageLabel(labelText: title),
          ],
        ),
        toolbarHeight: screenSize.height * 0.1,
      ),
      body: body,
      // ),
    );
  }
}
