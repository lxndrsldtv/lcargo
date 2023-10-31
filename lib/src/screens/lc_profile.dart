import 'package:flutter/material.dart';
import 'package:lcargo/src/widgets/lc_page.dart';

class LCProfile extends StatelessWidget {
  const LCProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const LCPage(
      title: 'Профиль',
      body: Center(
        child: Text('Профиль'),
      ),
    );
  }
}
