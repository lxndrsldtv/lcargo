import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lcargo/lc_router.dart';

class LCOrder extends StatelessWidget {
  const LCOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Order Details'),
            ElevatedButton(
              onPressed: () {
                context.goNamed(orderList);
              },
              child: const Text('Back To Order List'),
            ),
          ],
        ),
      ),
    );
  }
}
