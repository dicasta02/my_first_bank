import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_bank/ui/platform_widgets/platform_widget.dart';

class PlatformAppBar extends PlatformWidget<CupertinoNavigationBar, AppBar>
    implements PreferredSizeWidget {
  final Widget leading;
  final Widget title;
  final PreferredSizeWidget androidBottom;
  final List<Widget> actions;
  final bool automaticallyImplyLeading;
  final double titleHeight;
  final Color backgroundColor;

  PlatformAppBar({
    this.leading,
    this.title,
    this.androidBottom,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.titleHeight,
    this.backgroundColor,
  });

  @override
  AppBar createAndroidWidget(BuildContext context) => AppBar(
        leading: leading,
        title: title,
        bottom: androidBottom,
        actions: actions,
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: automaticallyImplyLeading,
      );

  @override
  CupertinoNavigationBar createIosWidget(BuildContext context) =>
      CupertinoNavigationBar(
        leading: leading,
        middle: title,
        trailing: actions != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: actions,
              )
            : null,
        automaticallyImplyLeading: automaticallyImplyLeading,
      );

  @override
  Size get preferredSize {
    if (Platform.isAndroid) {
      return Size.fromHeight((titleHeight ?? kToolbarHeight) +
          (androidBottom?.preferredSize?.height ?? 0.0));
    } else {
      return const Size.fromHeight(44.0);
    }
  }
}
