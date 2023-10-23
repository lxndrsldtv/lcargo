import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const OrderServiceExampleApp());
}

class OrderServiceExampleApp extends StatelessWidget {
  const OrderServiceExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Service Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      // debugShowMaterialGrid: true,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //TODO make template for all pages
    final theme = Theme.of(context);
    theme.brightness == Brightness.light
        ? SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: theme.colorScheme.background,
          ))
        : SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.light.copyWith(
            statusBarColor: theme.colorScheme.background,
          ));

    return const Scaffold(
      body: Center(child: Text('text')),
    );
  }
}
