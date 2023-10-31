import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lcargo/lc_router.dart';
import 'package:lcargo/src/widgets/lc_page.dart';
import 'package:order_service/order_service.dart';

class LCOrders extends StatelessWidget {
  const LCOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return LCPage(
      title: 'Заказы',
      body: DeliveryOrderList(
        deliveryOrderRepository: TemporaryDeliveryOrderRepository(),
      ),
    );
  }
}
