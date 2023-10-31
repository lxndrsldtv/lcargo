import 'dart:async';
import 'dart:math';

import 'package:order_service/src/models/delivery_order_view_model.dart';
import 'package:order_service/src/repositories/delivery_order_repository.dart';

import 'fake_delivery_order_states.dart';

class FakeDeliveryOrderRepository implements DeliveryOrderRepository {
  // late final StreamController<DeliveryOrderViewModel> streamController;

  final orders =
      List<StreamController<DeliveryOrderViewModel>>.empty(growable: true);

  // init() {
  //   streamController = StreamController<DeliveryOrderViewModel>.broadcast();
  // }

  // Stream<DeliveryOrderViewModel> get stream  {
  //   streamController.add(deliveryOrderViewModel1);
  //   return streamController.stream;
  // }

  DeliveryOrderViewModel getRandomState() {
    switch (Random().nextInt(9)) {
      case 0:
        return deliveryOrderViewModel1;
      case 1:
        return deliveryOrderViewModel2;
      case 2:
        return deliveryOrderViewModel3;
      case 3:
        return deliveryOrderViewModel4;
      case 4:
        return deliveryOrderViewModel5;
      case 5:
        return deliveryOrderViewModel6;
      case 6:
        return deliveryOrderViewModel7;
      case 7:
        return deliveryOrderViewModel8;
      case 8:
        return deliveryOrderViewModel9;
      default:
        return deliveryOrderViewModel1;
    }
  }

  setRandomStateToRandomOrder() {
    if (orders.isNotEmpty) {
      Future.delayed(
        Duration(seconds: Random().nextInt(4)),
        () => orders[Random().nextInt(orders.length)].add(getRandomState()),
      );
    }
    Future.delayed(
      Duration(seconds: Random().nextInt(4)),
      setRandomStateToRandomOrder,
    );
  }

  runEvents(StreamController<DeliveryOrderViewModel> streamController) {
    Future.delayed(
      const Duration(seconds: 1),
      () => streamController.sink.add(deliveryOrderViewModel1),
    );
    Future.delayed(
      const Duration(seconds: 2),
      () => streamController.sink.add(deliveryOrderViewModel2),
    );
    Future.delayed(
      const Duration(seconds: 3),
      () => streamController.sink.add(deliveryOrderViewModel3),
    );
    Future.delayed(
      const Duration(seconds: 4),
      () => streamController.sink.add(deliveryOrderViewModel4),
    );
    Future.delayed(
      const Duration(seconds: 5),
      () => streamController.sink.add(deliveryOrderViewModel5),
    );
    Future.delayed(
      const Duration(seconds: 6),
      () => streamController.sink.add(deliveryOrderViewModel6),
    );
    Future.delayed(
      const Duration(seconds: 7),
      () => streamController.sink.add(deliveryOrderViewModel7),
    );
    Future.delayed(
      const Duration(seconds: 8),
      () => streamController.sink.add(deliveryOrderViewModel8),
    );
    Future.delayed(
      const Duration(seconds: 9),
      () => streamController.sink.add(deliveryOrderViewModel9),
    );
  }

  @override
  Stream<DeliveryOrderViewModel> getOrderByIndex(int index) {
    if (index > orders.length - 1) {
      orders.add(StreamController<DeliveryOrderViewModel>.broadcast());
    }
    final streamController = orders[index];
    // runEvents(streamController);
    streamController.onListen = () => streamController.add(getRandomState());

    return streamController.stream;
  }
  
  @override
  int get orderCount => orders.length;
}
