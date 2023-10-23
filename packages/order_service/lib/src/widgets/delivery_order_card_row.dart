import 'package:flutter/material.dart';

class DeliveryOrderCardRow extends StatelessWidget {
  const DeliveryOrderCardRow(
      {super.key, required this.dotColor, required this.child});

  final Color dotColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxPossibleSize = constraints.biggest;
        final dotDiameter = (11.0 * maxPossibleSize.width) / 358.0;
        // log('dotDiameter: $dotDiameter');
        final txtMargin = (8.0 * maxPossibleSize.width) / 358.0;
        // log('txtMargin: $txtMargin');
        // log('${Theme.of(context).textTheme.headlineSmall}');
        return Row(
          children: [
            AnimatedContainer(
              width: dotDiameter,
              height: dotDiameter,
              margin: EdgeInsets.only(bottom: txtMargin / 2),
              decoration: BoxDecoration(
                  color: dotColor,
                  borderRadius: BorderRadius.circular(dotDiameter / 2)),
              duration: const Duration(milliseconds: 500),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(left: txtMargin, bottom: txtMargin / 2),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) =>
                          ScaleTransition(scale: animation, child: child),
                  layoutBuilder: (Widget? child, List<Widget> children) =>
                      Stack(
                    children: [
                      ...children,
                      child ?? const SizedBox(width: 0.0, height: 0.0)
                    ],
                  ),
                  child: child,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
