import 'package:flutter/material.dart';
import 'package:my_first_bank/app/settings/applications_assets.dart';
import 'package:my_first_bank/app/settings/applications_colors.dart';
import 'package:my_first_bank/blocs/provider/bloc.dart';
import 'package:my_first_bank/ui/base_state.dart';
import 'package:my_first_bank/ui/landing_page.dart';
import 'package:my_first_bank/ui/platform_widgets/platform_bottom.dart';

class NoAvailablePage extends StatefulWidget {
  @override
  _NoAvailablePageState createState() => _NoAvailablePageState();
}

class _NoAvailablePageState extends BaseState<NoAvailablePage, Bloc> {
  double imageHeight = 0.0;
  final _bottomContainerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var widgetsWidth = screenWidth * 0.6;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Container(
                height: 240.0,
                width: 120.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ApplicationsAssets.banners),
                    fit: BoxFit.fill,
                  ),
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              key: _bottomContainerKey,
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.all(0.0),
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                )),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
                      child: Image.asset(
                        ApplicationsAssets.construccion,
                        height: 120.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Text(
                        l10n.noAvailable,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ApplicationColors().neutralBlackColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 80.0),
                      width: widgetsWidth,
                      child: PlatformButton(
                        text: l10n.back,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LandingPage()),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      width: widgetsWidth,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Bloc getBlocInstance() {
    return null;
  }
}
