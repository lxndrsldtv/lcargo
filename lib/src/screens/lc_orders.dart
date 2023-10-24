import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lcargo/lc_router.dart';

class LCOrders extends StatelessWidget {
  const LCOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Orders'),
        ElevatedButton(
          onPressed: () {
            context.goNamed(orderDetails);
          },
          child: const Text('To Order Details'),
        ),
      ],
    );
  }
}
