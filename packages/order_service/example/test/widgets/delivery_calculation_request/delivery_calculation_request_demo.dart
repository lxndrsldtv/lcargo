import 'package:flutter/material.dart';

import 'package:order_service/src/widgets/delivery_calculation_request.dart';
import 'package:ui_kit/ui_kit.dart';

void main() {
  runApp(const DeliveryCalculationDemo());
}

class DeliveryCalculationDemo extends StatelessWidget {
  const DeliveryCalculationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery Calculation Request Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
      ),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme.dark(),
      ),
      themeMode: ThemeMode.light,
      // themeMode: ThemeMode.dark,
      // debugShowMaterialGrid: true,
      debugShowCheckedModeBanner: false,
      home: const DeliveryCalculationDemoHomePage(),
    );
  }
}

class DeliveryCalculationDemoHomePage extends StatelessWidget {
  const DeliveryCalculationDemoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    setStatusBarColorSameAsColorSchemeBackground(context);

    return const Scaffold(
      body: DeliveryCalculationRequest(),
    );
  }
}
