import 'package:flutter/material.dart';
import 'package:order_service/src/widgets/delivery_order_card_row.dart';

import '../models/delivery_order_view_model.dart';

class DeliveryOrderCard extends StatelessWidget {
  const DeliveryOrderCard({super.key, required this.deliveryOrderViewModel});

  final Stream<DeliveryOrderViewModel> deliveryOrderViewModel;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // log('maxWidth: ${maxPossibleSize.width}, maxHeight: ${maxPossibleSize.height}');
      const cardPadding = 16.0;
      // log('cardPadding: $cardPadding');
      const firstLineMargin = 8.0;
      // log('firstLineMargin: $firstLineMargin');
      return Card(
        elevation: 8.0,
        child: Container(
          padding: const EdgeInsets.all(cardPadding),
          child: StreamBuilder<DeliveryOrderViewModel>(
            stream: deliveryOrderViewModel,
            initialData: const DeliveryOrderViewModel.empty(),
            builder: (context, snapshot) {
              // log('snapshot.connectionState.name: ${snapshot.connectionState.name}');
              final deliveryOrderViewModel =
                  snapshot.data ?? const DeliveryOrderViewModel.empty();
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _stateRow(
                      context,
                      firstLineMargin,
                      deliveryOrderViewModel.stateColor,
                      deliveryOrderViewModel.stateDescription),
                  _idRow(context, deliveryOrderViewModel.id),
                  _pathPointsRow(context, deliveryOrderViewModel.pathStartPoint,
                      deliveryOrderViewModel.pathEndPoint),
                  _commentRow(context, deliveryOrderViewModel.comment),
                ],
              );
            },
          ),
        ),
      );
    });
  }

  Widget _stateRow(BuildContext context, double firstLineMargin, int stateColor,
      String stateDescription) {
    return Container(
      padding: EdgeInsets.only(bottom: firstLineMargin),
      child: DeliveryOrderCardRow(
        dotColor: Color(stateColor),
        child: Text(
          stateDescription,
          key: ValueKey<String>(stateDescription),
          style: Theme.of(context).textTheme.bodyMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _idRow(BuildContext context, String id) {
    return DeliveryOrderCardRow(
      dotColor: const Color(0x00ffffff),
      child: Text(id,
          key: ValueKey<String>(id),
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.w700)),
      // ),
    );
  }

  Widget _pathPointsRow(
      BuildContext context, String pathStartPoint, String pathEndPoint) {
    return DeliveryOrderCardRow(
      dotColor: const Color(0x00ffffff),
      child: Row(
        key: ValueKey<String>('$pathStartPoint$pathEndPoint'),
        children: [
          Text(
            pathStartPoint,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          pathStartPoint.isNotEmpty || pathEndPoint.isNotEmpty
              ? const Icon(Icons.arrow_right_alt_sharp)
              : const SizedBox(width: 0.0, height: 0.0),
          Text(
            pathEndPoint,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _commentRow(BuildContext context, String comment) {
    return DeliveryOrderCardRow(
      dotColor: const Color(0x00ffffff),
      child: Text(
        comment,
        key: ValueKey<String>(comment),
        style: Theme.of(context).textTheme.bodyMedium,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
