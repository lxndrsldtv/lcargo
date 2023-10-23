import 'package:flutter/material.dart';
import 'package:ui_kit/src/lc_app_theme.dart';

class LCButton extends StatelessWidget {
  const LCButton({super.key, required this.onPressed, required this.label});

  final void Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: 58.0,
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: LCAppTheme.mainColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
            ),
            onPressed: onPressed,
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                    fontFamily: 'Futura',
                    fontSize: 18.0,
                    color: LCAppTheme.activeButtonLabelColor),
              ),
            ),
          ),
        );
      },
    );
  }
}
