import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_bank/app/settings/applications_colors.dart';
import 'package:my_first_bank/ui/platform_widgets/platform_widget.dart';

class PlatformTabBar extends PlatformWidget<Widget, TabBar> {
  final List<String> tabs;
  final int currentIndex;
  final TabController controller;
  final ValueChanged onValueChange;
  final bool isScrollable;

  PlatformTabBar({
    this.tabs,
    this.currentIndex,
    this.controller,
    this.onValueChange,
    this.isScrollable = false,
  });

  @override
  TabBar createAndroidWidget(BuildContext context) {
    return TabBar(
      controller: controller,
      indicatorColor: Theme.of(context).primaryColor,
      labelStyle: TextStyle(fontSize: 16.0),
      unselectedLabelColor: ApplicationColors().defaultTextColor,
      unselectedLabelStyle: TextStyle(fontSize: 14),
      labelColor: Theme.of(context).primaryColor,
      tabs: tabs
          .map((e) => Tab(
                text: e,
              ))
          .toList(),
      isScrollable: isScrollable,
    );
  }

  @override
  Widget createIosWidget(BuildContext context) {
    Map<int, Widget> iosTabs = {};
    var counter = 0;
    tabs.forEach((element) {
      var item = Text(
        element,
        style: TextStyle(fontSize: 12.0),
      );
      iosTabs[counter] = item;
      counter = counter + 1;
    });

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: CupertinoSegmentedControl<int>(
        children: iosTabs,
        groupValue: currentIndex,
        onValueChanged: onValueChange,
      ),
    );
  }
}
