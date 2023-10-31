import 'package:flutter/material.dart';
import 'package:ui_kit/src/lc_app_theme.dart';

class LCInputText extends StatelessWidget {
  const LCInputText({
    super.key,
    required this.labelText,
    this.maxLines = 1,
    required this.onChanged,
    required this.onTap,
    this.focusNode,
  });

  final String labelText;
  final int maxLines;
  final FocusNode? focusNode;
  final void Function() onTap;
  final void Function(String) onChanged;

  final borderStyle = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(color: LCAppTheme.mainColor),
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      onChanged: onChanged,
      focusNode: focusNode,
      textAlignVertical: TextAlignVertical.top,
      style: LCAppTheme.lcOrdinaryTextStyle,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: LCAppTheme.lcTextInputHintStyle,
        border: borderStyle,
        enabledBorder: borderStyle,
        focusedBorder: borderStyle.copyWith(
          borderSide: borderStyle.borderSide.copyWith(
            width: 2.0,
          ),
        ),
      ),
      maxLines: maxLines,
    );
  }
}
