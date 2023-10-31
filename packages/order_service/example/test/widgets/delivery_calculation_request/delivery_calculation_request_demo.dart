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
        colorScheme: const ColorScheme.light(),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
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
    // setStatusBarColorSameAsColorSchemeBackground(context);

    return Scaffold(
      appBar: AppBar(),
      body: const DeliveryCalculationRequest(),
    );
  }
}
