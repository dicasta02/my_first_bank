import 'package:flutter/material.dart';
import 'package:my_first_bank/app/settings/applications_assets.dart';
import 'package:my_first_bank/ui/landing_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPage createState() => _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _setHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(ApplicationsAssets.splashImage)),
    );
  }

  void _setHomePage() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LandingPage()));
    });
  }
}
