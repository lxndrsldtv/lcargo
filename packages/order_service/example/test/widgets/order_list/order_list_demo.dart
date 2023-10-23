import 'package:flutter/material.dart';
import 'package:order_service/src/settings.dart';
import 'package:order_service/src/widgets//delivery_order_list.dart';
import 'package:ui_kit/ui_kit.dart';

import '../fake_delivery_order_repository.dart';

void main() {
  runApp(const StateCardDemo());
}

class StateCardDemo extends StatelessWidget {
  const StateCardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StateCard Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            const ColorScheme.light().copyWith(surfaceTint: Colors.white),
        fontFamily: 'Futura',
        textTheme: ThemeData().textTheme.copyWith(
            bodyLarge: TextStyle(color: Color(Settings().textColor)),
            bodyMedium: TextStyle(color: Color(Settings().textColor))),
      ),
      home: const MyHomePage(title: 'OrderList Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final FakeDeliveryOrderRepository fakeDeliveryOrderRepositoryImpl;

  @override
  void initState() {
    fakeDeliveryOrderRepositoryImpl = FakeDeliveryOrderRepository();
    fakeDeliveryOrderRepositoryImpl.setRandomStateToRandomOrder();

    super.initState();
  }

  void _addOrder() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LCPageLabel(
                labelText: 'Заказы',
              ),
              Flexible(
                child: DeliveryOrderList(
                  deliveryOrderRepository: fakeDeliveryOrderRepositoryImpl,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addOrder,
        tooltip: 'Add order',
        child: const Icon(Icons.add_card),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
