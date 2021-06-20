import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_first_bank/app/settings/applications_assets.dart';
import 'package:my_first_bank/app/settings/applications_colors.dart';
import 'package:my_first_bank/blocs/provider/bloc.dart';
import 'package:my_first_bank/ui/base_state.dart';
import 'package:my_first_bank/ui/home_page.dart';
import 'package:my_first_bank/ui/no_available_page.dart';
import 'package:my_first_bank/ui/platform_widgets/platform_bottom.dart';
import 'package:my_first_bank/ui/platform_widgets/platform_progress_indicator.dart';
import 'package:package_info/package_info.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends BaseState<LandingPage, Bloc> {
  String appVersion = '';
  double imageHeight = 0.0;
  final _bottomContainerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _getAppVersion();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var widgetsWidth = screenWidth * 0.6;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: imageHeight,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl:
                  'https://lh3.googleusercontent.com/proxy/vHMdxAMe2ZM-yE7hWimuLHXMe_qg5mS4r5iqZiFj6_aMUmR-3rI0BcI_BjjdztZrC6YjeSnqIKOYuWrwATJSt2rUJenRr7dehL4E_QCG4mRXPX77EgMJB0cfSwVhozxK-2OZUw',
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(
                child: PlatformProgressIndicator(),
              ),
            ),
          ),
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
                      padding: const EdgeInsets.only(top: 50.0, bottom: 12.0),
                      child: Image.asset(
                        ApplicationsAssets.logo,
                        height: 50.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Text(
                        l10n.landingTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ApplicationColors().neutralBlackColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      width: widgetsWidth,
                      child: PlatformButton(
                        text: l10n.signInText,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      width: widgetsWidth,
                      child: PlatformButton(
                        text: l10n.createAcount,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NoAvailablePage()),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        appVersion,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    )
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

  void _getAppVersion() {
    PackageInfo.fromPlatform().then((packageInfo) {
      var version = packageInfo.version;
      setState(() {
        appVersion = 'V$version';
      });
    });
  }
}
