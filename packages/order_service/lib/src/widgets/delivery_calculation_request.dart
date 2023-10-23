import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    log('DeliveryCalculationRequest build');

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

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints bc) {
          log('bc.maxHeight: ${bc.maxHeight}');
          // calc height top spaces can occupied
          final calculatedTopSpacerHeight =
              bc.maxHeight * maxTopSpacerHeightInPercentageOfAvailableSpace;
          log('calculatedTopSpacerHeight: $calculatedTopSpacerHeight');

          // calc height spacer must occupied
          final heightTopSpacerOccupied =
              calculatedTopSpacerHeight * topSpacerCount;
          final heightToDivideBetweenSpacers =
              bc.maxHeight - sumControlItemHeights - heightTopSpacerOccupied;
          final calculatedSpacerHeight =
              heightToDivideBetweenSpacers / spacerCount;
          final effectiveSpacerHeight =
              (calculatedSpacerHeight < minSpacerHeight
                      ? minSpacerHeight
                      : calculatedSpacerHeight)
                  .truncateToDouble();
          log('effectiveSpacerHeight: $effectiveSpacerHeight');

          // recalc top spacer height in case spacer is min height
          final effectiveTopSpacerHeight =
              (effectiveSpacerHeight == minSpacerHeight
                      ? calculatedTopSpacerHeight - topSpacerShrinkingStep <
                              minTopSpacerHeight
                          ? minTopSpacerHeight
                          : calculatedTopSpacerHeight - topSpacerShrinkingStep
                      : calculatedTopSpacerHeight)
                  .truncateToDouble();
          log('effectiveTopSpacerHeight: $effectiveTopSpacerHeight');

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
          log('bottomSpacerHeight: $bottomSpacerHeight');

          final calculatedHeight = effectiveTopSpacerHeight * topSpacerCount +
              effectiveSpacerHeight * spacerCount +
              bottomSpacerHeight +
              sumControlItemHeights;
          log('calculated height: $calculatedHeight');

          return GestureDetector(
            onTap: () {
              log('onTap');
              final currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
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
                      SizedBox(height: effectiveTopSpacerHeight),
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
                      SizedBox(
                          height: effectiveSpacerHeight < 32
                              ? effectiveSpacerHeight
                              : 32),
                      SizedBox(
                        height: 56,
                        child: LCInputText(
                          labelText: 'Куда',
                          onTap: () {},
                          onChanged: (t) => log(t),
                        ),
                      ),
                      SizedBox(
                          height: effectiveSpacerHeight < 32
                              ? effectiveSpacerHeight
                              : 32),
                      SizedBox(
                        height: 104,
                        child: LCInputText(
                          labelText: 'Описание товара',
                          maxLines: 3,
                          onChanged: (t) => log(t),
                          onTap: () {},
                        ),
                      ),
                      SizedBox(
                          height: effectiveSpacerHeight * 1.5 < 48
                              ? effectiveSpacerHeight * 1.5
                              : 48),
                      SizedBox(
                        height: 24,
                        child: LCCheckbox(
                          label: 'Обрешетка',
                          onChanged: (v) =>
                              log('checkbox: ${v ? 'checked' : 'unchecked'}'),
                        ),
                      ),
                      SizedBox(
                          height: effectiveSpacerHeight < 24
                              ? effectiveSpacerHeight
                              : 24),
                      SizedBox(
                        height: 24,
                        child: LCCheckbox(
                          label: 'Проверка перед отправкой',
                          onChanged: (v) =>
                              log('checkbox: ${v ? 'checked' : 'unchecked'}'),
                        ),
                      ),
                      // SizedBox(height: vertSpace * 3.5),
                      SizedBox(height: bottomSpacerHeight), // expandable
                      SizedBox(
                          height: effectiveSpacerHeight < 40
                              ? effectiveSpacerHeight
                              : 40),
                      SizedBox(
                        height: 56,
                        child: LCButton(
                            onPressed: () {}, label: 'Оставить заявку'),
                      ),
                      SizedBox(
                          height: effectiveSpacerHeight < 40
                              ? effectiveSpacerHeight
                              : 40),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      //TODO nav bar is not part of this page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        backgroundColor: LCAppTheme.bottomNavbarBackgroundColor,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          color: Color(0xff1F284D),
          fontFamily: 'Futura',
          fontSize: 12.0,
          letterSpacing: -0.24,
        ),
        selectedItemColor: LCAppTheme.bottomNavbarSelectedItemColor,
        items: const [
          BottomNavigationBarItem(
            label: 'Заказать',
            icon: Icon(Icons.account_box),
          ),
          BottomNavigationBarItem(
            label: 'Рассчитать',
            icon: Icon(Icons.calculate),
          ),
          BottomNavigationBarItem(
            label: 'FAQ',
            icon: Icon(Icons.question_answer),
          ),
          BottomNavigationBarItem(
            label: 'Профиль',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
