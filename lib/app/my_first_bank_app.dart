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
    ApplicationColors().secondaryTextColor = const Color(0xFF506296);
    ApplicationColors().defaultTextColor = const Color(0xFF757575);
    ApplicationColors().neutralBlackColor = const Color(0xFF4B4B4B);
  }

//  final FirebaseAnalytics analytics = FirebaseAnalytics();

  static const MaterialColor _primarySwatch = MaterialColor(
    _primarySwatchValue,
    <int, Color>{
      50: Color(0xFFe0f7fa),
      100: Color(0xFFb2ebf2),
      200: Color(0xFF80deea),
      300: Color(0xFF4dd0e1),
      400: Color(0xFF26c6da),
      500: Color(_primarySwatchValue),
      600: Color(0xFF00bcd4),
      700: Color(0xFF00acc1),
      800: Color(0xFF0097a7),
      900: Color(0xFF00838f),
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
