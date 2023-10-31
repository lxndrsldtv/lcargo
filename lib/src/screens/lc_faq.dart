import 'package:flutter/material.dart';
import 'package:lcargo/src/widgets/lc_page.dart';

class LCFaq extends StatelessWidget {
  const LCFaq({super.key});

  @override
  Widget build(BuildContext context) {
    return const LCPage(
      title: 'FAQ',
      body: Center(
        child: Text('FAQ'),
      ),
    );
  }
}
