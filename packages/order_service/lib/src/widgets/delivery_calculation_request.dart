import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class DeliveryCalculationRequest extends StatelessWidget {
  const DeliveryCalculationRequest({super.key});

  final spacerCount = 6.5;
  final minSpacerHeight = 8.0;
  final maxSumSpacerHeights = 216.0;
  final minBottomSpacerHeight = 0.0;

  final topSpacerCount = 1.5;
  final minTopSpacerHeight = 16.0;
  final topSpacerShrinkingStep = 2.0;
  final maxTopSpacerHeightInPercentageOfAvailableSpace = 0.1;

  final sumControlItemHeights = 376.0;

  @override
  Widget build(BuildContext context) {
    log('build', name: 'lCargo:DeliveryCalculationRequest:build');

    return 
    // Container(
    //   color: Colors.yellow,
    //   child: 
      LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints bc) {
          log('bc.maxHeight: ${bc.maxHeight}',
              name: 'lCargo:DeliveryCalculationRequest:build');
          // calc height top spacer will occupied
          final calculatedTopSpacerHeight =
              bc.maxHeight * maxTopSpacerHeightInPercentageOfAvailableSpace;
          log('calculatedTopSpacerHeight: $calculatedTopSpacerHeight',
              name: 'lCargo:DeliveryCalculationRequest:build');

          // calc height spacer must occupied
          final heightTopSpacerOccupied =
              calculatedTopSpacerHeight * topSpacerCount;

          final heightToDivideBetweenSpacers =
              bc.maxHeight - sumControlItemHeights - heightTopSpacerOccupied;

          final calculatedSpacerHeight =
              heightToDivideBetweenSpacers / spacerCount;

          final effectiveSpacerHeight = math
              .max(calculatedSpacerHeight, minSpacerHeight)
              .truncateToDouble();
          log('effectiveSpacerHeight: $effectiveSpacerHeight',
              name: 'lCargo:DeliveryCalculationRequest:build');

          // recalc top spacer height in case spacer is min height
          final effectiveTopSpacerHeight =
              (effectiveSpacerHeight == minSpacerHeight
                      ? calculatedTopSpacerHeight - topSpacerShrinkingStep <
                              minTopSpacerHeight
                          ? minTopSpacerHeight
                          : calculatedTopSpacerHeight - topSpacerShrinkingStep
                      : calculatedTopSpacerHeight)
                  .truncateToDouble();
          log('effectiveTopSpacerHeight: $effectiveTopSpacerHeight',
              name: 'lCargo:DeliveryCalculationRequest:build');

          // calc bottom spacer height, it take all that rest
          final sumSpacerHeights =
              effectiveSpacerHeight * spacerCount > maxSumSpacerHeights
                  ? maxSumSpacerHeights
                  : effectiveSpacerHeight * spacerCount;
          final restHeight = (bc.maxHeight -
              sumControlItemHeights -
              effectiveTopSpacerHeight * topSpacerCount -
              sumSpacerHeights);
          final bottomSpacerHeight = (restHeight < minBottomSpacerHeight
                  ? minBottomSpacerHeight
                  : restHeight)
              .truncateToDouble();
          log('bottomSpacerHeight: $bottomSpacerHeight',
              name: 'lCargo:DeliveryCalculationRequest:build');

          final calculatedHeight = effectiveTopSpacerHeight * topSpacerCount +
              effectiveSpacerHeight * spacerCount +
              bottomSpacerHeight +
              sumControlItemHeights;
          log('calculated height: $calculatedHeight',
              name: 'lCargo:DeliveryCalculationRequest:build');

          return GestureDetector(
            onTap: () {
              log('onTap', name: 'lCargo:DeliveryCalculationRequest:build');
              final currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Container(
              color: Theme.of(context).colorScheme.background,
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: bc.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // SizedBox(height: effectiv  eTopSpacerHeight),
                        const SizedBox(
                          height: 56,
                          child: LCPageLabel(labelText: 'Рассчитать'),
                        ),
                        SizedBox(height: effectiveTopSpacerHeight / 2),

                        SizedBox(
                          height: 56,
                          child: LCInputText(
                            labelText: 'Откуда',
                            onTap: () {},
                            onChanged: (t) => log(t),
                          ),
                        ),

                        /// spacer
                        SizedBox(
                          height: math.min(effectiveSpacerHeight, 32),
                        ),

                        SizedBox(
                          height: 56,
                          child: LCInputText(
                            labelText: 'Куда',
                            onTap: () {},
                            onChanged: (t) => log(t),
                          ),
                        ),

                        /// spacer
                        SizedBox(
                          height: math.min(effectiveSpacerHeight, 32),
                        ),

                        SizedBox(
                          height: 104,
                          child: LCInputText(
                            labelText: 'Описание товара',
                            maxLines: 3,
                            onChanged: (t) => log(t),
                            onTap: () {},
                          ),
                        ),

                        /// spacer * 1.5
                        SizedBox(
                          height: math.min(effectiveSpacerHeight * 1.5, 48),
                        ),

                        SizedBox(
                          height: 24,
                          child: LCCheckbox(
                            label: 'Обрешетка',
                            onChanged: (v) => log(
                                'checkbox: ${v ? 'checked' : 'unchecked'}',
                                name:
                                    'lCargo:DeliveryCalculationRequest:build'),
                          ),
                        ),

                        /// spacer
                        SizedBox(
                          height: math.min(effectiveSpacerHeight, 24),
                        ),

                        SizedBox(
                          height: 24,
                          child: LCCheckbox(
                            label: 'Проверка перед отправкой',
                            onChanged: (v) => log(
                                'checkbox: ${v ? 'checked' : 'unchecked'}',
                                name:
                                    'lCargo:DeliveryCalculationRequest:build'),
                          ),
                        ),

                        SizedBox(height: bottomSpacerHeight), // expandable

                        /// spacer
                        SizedBox(
                          height: math.min(effectiveSpacerHeight, 40.0),
                        ),

                        SizedBox(
                          height: 56,
                          child: LCButton(
                              onPressed: () {}, label: 'Оставить заявку'),
                        ),

                        /// spacer
                        SizedBox(
                          height: math.min(effectiveSpacerHeight, 40),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      // ),
    );
  }
}
