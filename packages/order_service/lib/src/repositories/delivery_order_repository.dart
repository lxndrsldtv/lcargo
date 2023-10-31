import 'package:order_service/src/models/delivery_order_view_model.dart';

abstract interface class DeliveryOrderRepository {
  int get orderCount;
  // DeliveryOrderViewModel getOrderById(String id);
  Stream<DeliveryOrderViewModel> getOrderByIndex(int index);
  // List<DeliveryOrderViewModel> getOrders
}

class TemporaryDeliveryOrderRepository implements DeliveryOrderRepository {
  final _orders = List<Stream<DeliveryOrderViewModel>>.empty(growable: true);

  @override
  int get orderCount => _orders.length;

  @override
  Stream<DeliveryOrderViewModel> getOrderByIndex(int index) {
    return _orders[index];
  }
}
