import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_bank/app/settings/app_localizations.dart';

abstract class PlatformWidget<I extends Widget, A extends Widget>
    extends StatelessWidget {
  I createIosWidget(BuildContext context);

  A createAndroidWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return createAndroidWidget(context);
    } else if (Platform.isIOS) {
      return createIosWidget(context);
    }
    return Container();
  }
}

class ErrorText extends StatefulWidget {
  final String error;

  ErrorText(this.error);

  @override
  _ErrorTextState createState() => _ErrorTextState();
}

class _ErrorTextState extends State<ErrorText> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      vsync: this,
      duration: Duration(milliseconds: 200),
      child: widget.error == null
          ? Container()
          : Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                widget.error,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .apply(color: Theme.of(context).errorColor),
                maxLines: 3,
              ),
            ),
    );
  }
}

const double _kPickerContainerHeight = 268.0;
const double _kPickerSheetHeight = 216.0;

Widget buildBottomPicker(BuildContext context, Widget picker) {
  return SizedBox.fromSize(
    size: Size(double.infinity, _kPickerContainerHeight),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          color: CupertinoColors.white,
          child: Align(
            alignment: Alignment.centerRight,
            child: CupertinoButton(
              child: Text(AppLocalizations.of(context).accept),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        Container(
          height: _kPickerSheetHeight,
          padding: const EdgeInsets.only(top: 0.0),
          color: CupertinoColors.white,
          child: DefaultTextStyle(
            style: const TextStyle(
              color: CupertinoColors.black,
              fontSize: 22.0,
            ),
            child: GestureDetector(
              onTap: () {},
              child: SafeArea(
                top: false,
                child: picker,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
