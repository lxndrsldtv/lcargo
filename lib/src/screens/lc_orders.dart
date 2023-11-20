import 'package:flutter/material.dart';
import 'package:lcargo/lc_app_dependencies_config.dart';
import 'package:lcargo/src/l10n/app_localizations.dart';
import 'package:lcargo/src/widgets/lc_page.dart';
import 'package:order_service/order_service.dart';

class LCOrders extends StatelessWidget {
  const LCOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return LCPage(
      title: appLocalizations?.pageTitleOrders ?? 'Заказы',
      body: DeliveryOrderList(
        deliveryOrderRepository:
            LCAppDependenciesConfig().configureDeliveryOrderRepository()(),
      ),
    );
  }
}
