import 'package:order_service/src/models/delivery_order_view_model.dart';

abstract interface class DeliveryOrderRepository {
  // DeliveryOrderViewModel getOrderById(String id);
  Stream<DeliveryOrderViewModel> getOrderByIndex(int index);
  // List<DeliveryOrderViewModel> getOrders
}
