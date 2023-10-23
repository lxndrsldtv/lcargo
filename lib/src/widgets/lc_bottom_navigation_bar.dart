import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
