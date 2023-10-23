import 'package:flutter/material.dart';

import '../ui_kit.dart';

class LCCheckbox extends StatefulWidget {
  const LCCheckbox({
    super.key,
    this.value = false,
    this.label = '',
    required this.onChanged,
  });

  final bool value;
  final String label;
  final void Function(bool) onChanged;

  @override
  State<LCCheckbox> createState() => _LCCheckboxState();
}

class _LCCheckboxState extends State<LCCheckbox> {
  bool value = false;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  void handleOnTap() {
    widget.onChanged(!value);
    setState(() {
      value = !value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: handleOnTap,
          splashColor: LCAppTheme.mainColor,
          child: Container(
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: LCAppTheme.mainColor)),
            child: Icon(
              value ? Icons.check : null,
              color: LCAppTheme.mainColor,
              size: 16.0,
            ),
          ),
        ),
        const SizedBox(
          width: 16.0,
        ),
        Text(
          widget.label,
          style: const TextStyle(
              fontFamily: 'Futura', fontSize: 16, color: LCAppTheme.mainColor),
        ),
      ],
    );
  }
}