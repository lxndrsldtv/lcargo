import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

void main() {
  runApp(const UIKitExampleApp());
}

class UIKitExampleApp extends StatelessWidget {
  const UIKitExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Kit Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        // checkboxTheme: CheckboxThemeData().copyWith(
        //   checkColor: Checkbox.,
        // )
      ),
      home: const UIKitHomePage(title: 'UI Kit Example Home Page'),
    );
  }
}

class UIKitHomePage extends StatefulWidget {
  const UIKitHomePage({super.key, required this.title});

  final String title;

  @override
  State<UIKitHomePage> createState() => _UIKitHomePageState();
}

class _UIKitHomePageState extends State<UIKitHomePage> {
  // void _changeState() {
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const Divider(),
              const Text('LCPageLabel'),
              const LCPageLabel(labelText: 'Label Заказы'),
              const Divider(),
              const Text('LCInputText'),
              LCInputText(
                labelText: 'Откуда (1 line)',
                onChanged: (t) => log(t),
                onTap: () {},
              ),
              const SizedBox(width: 0.0, height: 8.0),
              LCInputText(
                labelText: 'Описание товара (3 lines)',
                maxLines: 3,
                onChanged: (t) => log(t),
                onTap: () {},
              ),
              const Divider(),
              const Text('LCButton'),
              LCButton(onPressed: () {}, label: 'Оставить заявку'),
              const Divider(),
              const Text('LCCheckbox'),
              LCCheckbox(
                  label: 'Обрешетка',
                  onChanged: (v) =>
                      log('checkbox: ${v ? 'checked' : 'unchecked'}')),
              const Divider(),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Navigator.of(context).push(MaterialPageRoute(
      //       builder: (ctx) => const LCPage(
      //             labelText: 'LCPage',
      //           ))),
      //   tooltip: 'Open LCPage',
      //   child: const Icon(Icons.pageview),
      // ),
    );
  }
}
