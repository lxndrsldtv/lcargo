import 'package:flutter/material.dart';

import 'package:order_service/src/widgets/delivery_calculation_request.dart';

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
        useMaterial3: true,
        colorScheme: const ColorScheme.light(),
      ),
      // debugShowMaterialGrid: true,
      debugShowCheckedModeBanner: false,
      home: const DeliveryCalculationDemoHomePage(
          title: 'Delivery Calculation Request Demo Page'),
    );
  }
}

class DeliveryCalculationDemoHomePage extends StatefulWidget {
  const DeliveryCalculationDemoHomePage({super.key, required this.title});

  final String title;

  @override
  State<DeliveryCalculationDemoHomePage> createState() =>
      _DeliveryCalculationDemoHomePageState();
}

class _DeliveryCalculationDemoHomePageState
    extends State<DeliveryCalculationDemoHomePage> {
  @override
  Widget build(BuildContext context) {
    return const DeliveryCalculationRequest();
  }
}
