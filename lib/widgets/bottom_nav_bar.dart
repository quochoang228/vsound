import 'package:flutter/material.dart';
import 'package:vsounds/design/colors.dart';
import 'package:vsounds/design/text_style.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.currentIndex,
    required this.onTap,
    required this.items,
    super.key,
  });

  final int currentIndex;
  final ValueSetter<int> onTap;

  final List<BottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.bgSecondary,
      selectedItemColor: AppColors.sysPrimery,
      selectedFontSize: 10,
      selectedLabelStyle: UITextStyles.nav,

      unselectedItemColor: AppColors.sysDarkGray,
      unselectedFontSize: 10,
      unselectedLabelStyle: UITextStyles.nav,

      enableFeedback: true,
      // elevation: 20,

      elevation: 20,
      type: BottomNavigationBarType.fixed,
      items: items,
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}

Widget iconNav({required Widget child}) => Container(
      padding: const EdgeInsets.only(bottom: 3),
      child: child,
    );
