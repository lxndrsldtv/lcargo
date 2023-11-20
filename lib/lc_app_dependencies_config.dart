import 'package:order_service/order_service.dart';

class LCAppDependenciesConfig {
  DeliveryOrderRepository Function() configureDeliveryOrderRepository() =>
      () => TemporaryDeliveryOrderRepository();
}
