import 'package:flutter/material.dart';
import 'package:my_first_bank/app/settings/applications_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:my_first_bank/app/settings/app_localizations.dart';
import 'package:my_first_bank/ui/splash_page.dart';

class MyFirstBank extends StatelessWidget {
  MyFirstBank() {
    ApplicationColors().primarySwatch = _primarySwatch;
    ApplicationColors().secondaryButtonColor = const Color(0xFF00BAA7);
    ApplicationColors().defaultTextColor = const Color(0xFF757575);
    ApplicationColors().neutralBlackColor = const Color(0xFF4B4B4B);
  }

//  final FirebaseAnalytics analytics = FirebaseAnalytics();

  static const MaterialColor _primarySwatch = MaterialColor(
    _primarySwatchValue,
    <int, Color>{
      50: Color(0xFFFBE6EE),
      100: Color(0xFFF4C0D5),
      200: Color(0xFFED96BA),
      300: Color(0xFFE56B9E),
      400: Color(0xFFE04C89),
      500: Color(_primarySwatchValue),
      600: Color(0xFFD6276C),
      700: Color(0xFFD02161),
      800: Color(0xFFCB1B57),
      900: Color(0xFFC21044),
    },
  );
  static const int _primarySwatchValue = 0xFF00BAA7;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizationsDelegate(),
      ],
      supportedLocales: [
        const Locale("es"),
        const Locale("en"),
      ],
      home: SplashPage(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: _primarySwatch,
          brightness: Brightness.light,
        ),
        brightness: Brightness.light,
        fontFamily: 'Open Sans',
        primarySwatch: _primarySwatch,
        buttonColor: Color(0xFF506296),
        appBarTheme: AppBarTheme(color: Color(0xFF757575)),
        cursorColor: _primarySwatch,
      ),
    );
  }
}
