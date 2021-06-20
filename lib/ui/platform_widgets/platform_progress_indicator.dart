import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_bank/ui/platform_widgets/platform_widget.dart';

class PlatformProgressIndicator extends PlatformWidget<
    CupertinoActivityIndicator, CircularProgressIndicator> {
  final Animation<Color> valueColor;

  PlatformProgressIndicator({
    this.valueColor,
  });

  @override
  CupertinoActivityIndicator createIosWidget(BuildContext context) {
    return CupertinoActivityIndicator(
      radius: 15,
    );
  }

  @override
  CircularProgressIndicator createAndroidWidget(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: valueColor,
    );
  }
}
