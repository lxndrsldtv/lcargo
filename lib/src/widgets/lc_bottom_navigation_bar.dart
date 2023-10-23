import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

class LCBottomNavigationBar extends StatefulWidget {
  const LCBottomNavigationBar({
    super.key,
  });

  @override
  State<LCBottomNavigationBar> createState() => _LCBottomNavigationBarState();
}

class _LCBottomNavigationBarState extends State<LCBottomNavigationBar> {
  final _currentIndex = 0;



  @override
  Widget build(BuildContext context) {
    final td = Theme.of(context).bottomNavigationBarTheme;
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          label: 'Заказать',
          icon: SvgPicture.asset(
            'assets/images/orders.svg',
            colorFilter: ColorFilter.mode(
                _currentIndex == 0
                    ? td.selectedItemColor!
                    : td.unselectedItemColor!,
                BlendMode.srcIn),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Рассчитать',
          icon: SvgPicture.asset(
            'assets/images/calculator.svg',
            colorFilter: ColorFilter.mode(
                _currentIndex == 1
                    ? td.selectedItemColor!
                    : td.unselectedItemColor!,
                BlendMode.srcIn),
          ),
        ),
        BottomNavigationBarItem(
          label: 'FAQ',
          icon: SvgPicture.asset(
            'assets/images/faq.svg',
            colorFilter: ColorFilter.mode(
                _currentIndex == 2
                    ? td.selectedItemColor!
                    : td.unselectedItemColor!,
                BlendMode.srcIn),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Профиль',
          icon: SvgPicture.asset(
            'assets/images/profile.svg',
            colorFilter: ColorFilter.mode(
                _currentIndex == 3
                    ? td.selectedItemColor!
                    : td.unselectedItemColor!,
                BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}
