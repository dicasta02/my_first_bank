import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_bank/app/settings/app_localizations.dart';
import 'package:my_first_bank/ui/platform_widgets/platform_alert_action.dart';
import 'package:my_first_bank/ui/platform_widgets/platform_alert_dialog.dart';

enum AlertType { success, error, confirmation }

class Alert {
  static const String text = "text";
  static const String value = "value";
  static const String icon = "icon";

  static Future<T> _setupPlatformDialog<T>(
      BuildContext context, WidgetBuilder builder) {
    if (Platform.isAndroid) {
      return showDialog<T>(
        context: context,
        builder: builder,
        barrierDismissible: false,
      );
    } else {
      return showCupertinoDialog<T>(
        context: context,
        builder: builder,
      );
    }
  }

  static Future<T> showCustomPlatformDialog<T>({
    @required BuildContext context,
    String title,
    Widget content,
    String positiveTextButton,
    VoidCallback positiveOnPressed,
    String destructiveTextButton,
    VoidCallback destructiveOnPressed,
    String negativeTextButton,
    VoidCallback negativeOnPressed,
  }) {
    var titleW = _getTitle(title);
    var contentW = content != null
        ? WillPopScope(
            onWillPop: () => Future.value(false),
            child: content,
          )
        : null;
    var actions = _getActions(
      positiveTextButton,
      positiveOnPressed,
      negativeTextButton,
      negativeOnPressed,
      destructiveTextButton,
      destructiveOnPressed,
    );
    return _setupPlatformDialog(
      context,
      (context) => PlatformAlertDialog(
        title: titleW,
        content: contentW,
        actions: actions,
      ),
    );
  }

  static Future<T> showPlatformDialog<T>({
    @required BuildContext context,
    String title,
    String content,
    String positiveTextButton,
    final VoidCallback positiveOnPressed,
    String destructiveTextButton,
    final VoidCallback destructiveOnPressed,
    String negativeTextButton,
    final VoidCallback negativeOnPressed,
  }) {
    var titleW = _getTitle(title);
    Widget contentW = content != null
        ? WillPopScope(
            onWillPop: () => Future.value(false),
            child: Text(
              content,
              textAlign: TextAlign.center,
            ),
          )
        : null;
    var actions = _getActions(
      positiveTextButton,
      positiveOnPressed,
      negativeTextButton,
      negativeOnPressed,
      destructiveTextButton,
      destructiveOnPressed,
    );
    return _setupPlatformDialog(
      context,
      (context) => PlatformAlertDialog(
        title: titleW,
        content: contentW,
        actions: actions,
      ),
    );
  }

  static Widget _getTitle(String title) {
    Widget titleW = title != null
        ? Text(
            title,
            textAlign: TextAlign.center,
          )
        : null;
    return titleW;
  }

  static List<Widget> _getActions(
    String positiveTextButton,
    VoidCallback positiveOnPressed,
    String negativeTextButton,
    VoidCallback negativeOnPressed,
    String destructiveTextButton,
    VoidCallback destructiveOnPressed,
  ) {
    var actions = <Widget>[];
    if (negativeTextButton != null) {
      actions.add(PlatformDialogAction(
        text: negativeTextButton,
        onPressed: negativeOnPressed,
      ));
    }
    if (positiveTextButton != null) {
      actions.add(PlatformDialogAction(
        text: positiveTextButton,
        onPressed: positiveOnPressed,
        isDefaultAction: true,
      ));
    }
    if (destructiveTextButton != null) {
      actions.add(PlatformDialogAction(
        text: destructiveTextButton,
        onPressed: destructiveOnPressed,
        isDestructiveAction: true,
      ));
    }
    return actions.isEmpty ? null : actions;
  }

  static Future<T> _setupPlatformModalBottomSheet<T>(
    BuildContext context, {
    WidgetBuilder androidBuilder,
    WidgetBuilder iosBuilder,
  }) {
    if (Platform.isAndroid) {
      return showModalBottomSheet(
        context: context,
        builder: androidBuilder,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
      );
    } else {
      return showCupertinoModalPopup(
        context: context,
        builder: iosBuilder,
      );
    }
  }

  static Future<T> showPlatformActionsModalBottomSheet<T>(
    BuildContext context, {
    String title,
    List<Map<String, dynamic>> actions,
  }) {
    return _setupPlatformModalBottomSheet<T>(
      context,
      androidBuilder: (context) => ListView(
        shrinkWrap: true,
        children: List.generate(
            1,
            (i) => title == null
                ? Container()
                : ListTile(
                    title: Text(
                      title,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ))
          ..addAll(actions
              .map((action) => ListTile(
                    title: Text(action[text]),
                    leading: action[icon] == null ? null : Icon(action[icon]),
                    onTap: () {
                      Navigator.of(context).pop(action[value]);
                    },
                  ))
              .toList()),
      ),
      iosBuilder: (context) => CupertinoActionSheet(
        title: title == null ? null : Text(title),
        actions: actions
            .map((action) => CupertinoActionSheetAction(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      action[icon] == null
                          ? Container()
                          : Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                action[icon],
                                color: Theme.of(context).buttonColor,
                              ),
                            ),
                      Text(action[text]),
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(action[value]);
                  },
                ))
            .toList(),
        cancelButton: CupertinoActionSheetAction(
          child: Text(AppLocalizations.of(context).cancel),
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  static Future<T> showCustomPlatformActionsModalBottomSheet<T>(
    BuildContext context, {
    Widget widget,
  }) {
    return _setupPlatformModalBottomSheet<T>(
      context,
      androidBuilder: (context) => widget,
      iosBuilder: (context) => CupertinoActionSheet(
        message: widget,
        cancelButton: CupertinoActionSheetAction(
          child: Text(AppLocalizations.of(context).cancel),
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
