import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_bank/ui/platform_widgets/platform_widget.dart';

class PlatformBottomTabBar
    extends PlatformWidget<CupertinoTabBar, BottomNavigationBar> {
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  PlatformBottomTabBar({
    @required this.items,
    this.currentIndex = 0,
    this.onTap,
  });

  @override
  BottomNavigationBar createAndroidWidget(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Theme.of(context).accentColor,
      unselectedItemColor: Theme.of(context).unselectedWidgetColor,
      showUnselectedLabels: true,
    );
  }

  @override
  CupertinoTabBar createIosWidget(BuildContext context) {
    return CupertinoTabBar(
      items: items,
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: Colors.transparent,
    );
  }
}
