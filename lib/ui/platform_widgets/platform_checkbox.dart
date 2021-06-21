import 'package:flutter/material.dart';

class PlatformCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Widget text;
  final bool checkboxRight;

  PlatformCheckbox({
    Key key,
    @required this.value,
    @required this.onChanged,
    @required this.text,
    this.checkboxRight = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          checkboxRight
              ? SizedBox()
              : _CheckBoxWidget(
                  value: value,
                  rightPadding: 5.0,
                ),
          Expanded(child: text),
          checkboxRight
              ? _CheckBoxWidget(
                  value: value,
                  leftPadding: 5.0,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

class _CheckBoxWidget extends StatelessWidget {
  final double leftPadding;
  final double rightPadding;
  final bool value;

  _CheckBoxWidget({
    Key key,
    this.leftPadding = 0.0,
    this.rightPadding = 0.0,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
      child: Icon(
        value
            ? Icons.check_box_outline_blank
            : Icons.check_box_outline_blank_outlined,
        color: value ? Theme.of(context).buttonColor : Colors.grey,
      ),
    );
  }
}
