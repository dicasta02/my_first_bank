import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_bank/app/settings/applications_colors.dart';
import 'package:my_first_bank/ui/platform_widgets/platform_progress_indicator.dart';
import 'package:my_first_bank/ui/platform_widgets/platform_widget.dart';

class PlatformButton extends PlatformWidget<Widget, Widget> {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isSecondary;
  final Color color;
  final Color textColor;
  final Widget child;
  final EdgeInsetsGeometry padding;

  PlatformButton({
    @required this.onPressed,
    this.text,
    this.isLoading = false,
    this.isSecondary = false,
    this.color,
    this.textColor,
    this.child,
    this.padding,
  });

  @override
  Widget createAndroidWidget(BuildContext context) {
    return RaisedButton(
      shape: StadiumBorder(),
      color: isSecondary ? ApplicationColors().secondaryButtonColor : color,
      disabledColor: const Color(0xFFDDDDDD),
      padding: padding ?? const EdgeInsets.all(12.0),
      child: isLoading
          ? Container(
              width: 18.0,
              height: 18.0,
              child: PlatformProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : child == null
              ? Text(
                  text?.toUpperCase() ?? '',
                  style: TextStyle(color: textColor ?? Colors.white),
                )
              : child,
      onPressed: onPressed,
    );
  }

  @override
  Widget createIosWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CupertinoButton(
        padding: padding ??
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        borderRadius: BorderRadius.circular(30.0),
        color: isSecondary
            ? ApplicationColors().secondaryButtonColor
            : color ?? Theme.of(context).buttonColor,
        disabledColor: Color(0xFFDDDDDD),
        child: isLoading
            ? Container(
                width: 20.0,
                height: 20.0,
                child: PlatformProgressIndicator(),
              )
            : child == null
                ? Text(
                    'Cargando',
                    style: TextStyle(color: textColor ?? Colors.white),
                  )
                : child,
        onPressed: onPressed,
      ),
    );
  }
}
