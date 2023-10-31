import 'package:flutter/material.dart';
import 'package:order_service/src/repositories/delivery_order_repository.dart';
import 'package:order_service/src/widgets/delivery_order_card.dart';
import 'package:ui_kit/ui_kit.dart';

class DeliveryOrderList extends StatelessWidget {
  const DeliveryOrderList({super.key, required this.deliveryOrderRepository});

  final DeliveryOrderRepository deliveryOrderRepository;

  @override
  Widget build(BuildContext context) {
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
        : const Center(
          //TODO create ui kit element for this text style (lc_ordinar_text)
            child: Text(
              'Список заказов пуст.',
              style: TextStyle(
                  fontFamily: 'Futura',
                  fontSize: 16,
                  color: LCAppTheme.mainColor),
              overflow: TextOverflow.ellipsis,
            ),
          );
  }
}
