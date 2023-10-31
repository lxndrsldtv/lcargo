import 'package:flutter/material.dart';
import 'package:order_service/src/repositories/delivery_order_repository.dart';
import 'package:order_service/src/widgets/delivery_order_card.dart';

class DeliveryOrderList extends StatelessWidget {
  const DeliveryOrderList({super.key, required this.deliveryOrderRepository});

  final DeliveryOrderRepository deliveryOrderRepository;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return DeliveryOrderCard(
            deliveryOrderViewModel:
                deliveryOrderRepository.getOrderByIndex(index));
      },
    );
  }
}
