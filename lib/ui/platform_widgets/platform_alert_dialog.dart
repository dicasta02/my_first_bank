import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_bank/ui/platform_widgets/platform_widget.dart';

class PlatformAlertDialog
    extends PlatformWidget<CupertinoAlertDialog, AlertDialog> {
  final Widget title;
  final Widget content;
  final List<Widget> actions;

  PlatformAlertDialog({
    @required this.title,
    @required this.content,
    @required this.actions,
  });

  @override
  AlertDialog createAndroidWidget(BuildContext context) {
    return AlertDialog(
      title: title,
      content: content,
      actions: actions,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    );
  }

  @override
  CupertinoAlertDialog createIosWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: title,
      content: title != null && content != null
          ? Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: content,
            )
          : content,
      actions: actions ?? [],
    );
  }
}
