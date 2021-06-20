import 'package:flutter/material.dart';

class ApplicationColors {
  static ApplicationColors _singleton;

  MaterialColor primarySwatch;
  Color secondaryButtonColor;
  Color defaultTextColor;
  Color grayIconsColor;
  Color neutralBlackColor;

  factory ApplicationColors() {
    if (_singleton == null) {
      _singleton = ApplicationColors._();
    }
    return _singleton;
  }

  ApplicationColors._();
}
