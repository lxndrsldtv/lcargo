import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LCBottomNavigationBar extends StatelessWidget {
  const LCBottomNavigationBar({
    super.key,
    required this.index,
    required this.onTap,
  });

  final int index;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final td = Theme.of(context).bottomNavigationBarTheme;
    return BottomNavigationBar(
      currentIndex: index,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          label: 'Заказы',
          icon: SvgPicture.asset(
            'assets/images/orders.svg',
            colorFilter: ColorFilter.mode(
                index == 0
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
                index == 1
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
                index == 2
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
                index == 3
                    ? td.selectedItemColor!
                    : td.unselectedItemColor!,
                BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}
