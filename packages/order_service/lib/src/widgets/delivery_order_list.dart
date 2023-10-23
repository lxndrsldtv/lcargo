import 'package:flutter/material.dart';
import 'package:order_service/src/repositories/delivery_order_repository.dart';
import 'package:order_service/src/widgets/delivery_order_card.dart';

class DeliveryOrderList extends StatelessWidget {
  const DeliveryOrderList({super.key, required this.deliveryOrderRepository});

  final DeliveryOrderRepository deliveryOrderRepository;

  @override
  Widget build(BuildContext context) {
    return
        // Column(
        // children: [
        //   const PageLabel(labelText: '',),
        //   Text(
        //     'Заказы',
        //     style: Theme.of(context).textTheme.titleLarge,
        //   ),
        //   Flexible(
        //     child:
        ListView.builder(
      itemBuilder: (context, index) {
        return DeliveryOrderCard(
            deliveryOrderViewModel:
                deliveryOrderRepository.getOrderByIndex(index));
      },
      // ),
      //   ),
      // ],
    );
  }
}
