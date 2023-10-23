import 'package:flutter/material.dart';

class LCBottomNavigationBarThemeData extends BottomNavigationBarThemeData {
  static const lcSelectedLabelStyle = TextStyle(
    fontFamily: 'Futura',
    fontSize: 12.0,
    letterSpacing: -0.24,
  );

  const LCBottomNavigationBarThemeData.light({
    super.backgroundColor = const Color(0xFFF9F9F9),
    super.selectedLabelStyle = lcSelectedLabelStyle,
    super.selectedItemColor = const Color(0xFF1F284D),
    super.unselectedItemColor = const Color(0xFF979797),
  });

  const LCBottomNavigationBarThemeData.dark1({
    super.backgroundColor = const Color(0xFF293666),
    super.selectedLabelStyle = lcSelectedLabelStyle,
    super.selectedItemColor = const Color(0xFFFFFFFF),
    super.unselectedItemColor = const Color(0xFF979797),
  });

  const LCBottomNavigationBarThemeData.dark2({
    super.backgroundColor = const Color(0xFF1F284D),
    super.selectedLabelStyle = lcSelectedLabelStyle,
    super.selectedItemColor = const Color(0xFFFFFFFF),
    super.unselectedItemColor = const Color(0xFF979797),
  });
}
