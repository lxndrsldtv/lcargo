import 'package:flutter/material.dart';
import 'package:order_service/order_service.dart';
import 'package:ui_kit/ui_kit.dart';

class DeliveryOrderList extends StatelessWidget {
  const DeliveryOrderList({super.key, required this.deliveryOrderRepository});

  final DeliveryOrderRepository deliveryOrderRepository;

  @override
  Widget build(BuildContext context) {
    final orderServiceLocalizations = OrderServiceLocalizations.of(context);

    return deliveryOrderRepository.orderCount > 0
        ? ListView.builder(
            itemBuilder: (context, index) {
              return deliveryOrderRepository.orderCount > 0
                  ? DeliveryOrderCard(
                      deliveryOrderViewModel:
                          deliveryOrderRepository.getOrderByIndex(index))
                  : null;
            },
          )
        : Center(
            child: LCTextFut16(orderServiceLocalizations?.theOrderLisIsEmpty ??
                'Список заказов пуст.'),
          );
  }
}
