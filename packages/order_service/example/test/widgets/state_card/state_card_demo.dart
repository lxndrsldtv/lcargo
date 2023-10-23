import 'package:flutter/material.dart';
import 'package:order_service/src/settings.dart';
import 'package:order_service/src/widgets/delivery_order_card.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)
            .copyWith(surfaceTint: Colors.white),
        fontFamily: 'Futura',
        textTheme: ThemeData().textTheme.copyWith(
            bodyLarge: TextStyle(color: Color(Settings().textColor)),
            bodyMedium: TextStyle(color: Color(Settings().textColor))),
      ),
      // darkTheme: ThemeData.dark(),
      darkTheme: ThemeData.light(),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(title: 'StateCard Demo Page'),
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
  late final FakeDeliveryOrderRepository fakeDeliveryOrderRepository;

  @override
  void initState() {
    fakeDeliveryOrderRepository = FakeDeliveryOrderRepository();
    fakeDeliveryOrderRepository.setRandomStateToRandomOrder();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: DeliveryOrderCard(
            deliveryOrderViewModel:
                fakeDeliveryOrderRepository.getOrderByIndex(0),
          ),
        ),
      ),
      backgroundColor: const Color(0xff02598A),
    );
  }
}
