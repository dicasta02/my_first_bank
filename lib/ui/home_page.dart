import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:my_first_bank/app/settings/applications_assets.dart';
import 'package:my_first_bank/app/settings/applications_colors.dart';
import 'package:my_first_bank/di/injector.dart';
import 'package:my_first_bank/models/aunthentication_response.dart';
import 'package:my_first_bank/models/authetication_request.dart';
import 'package:my_first_bank/models/result.dart';
import 'package:my_first_bank/models/shared_preferences_keys.dart';
import 'package:my_first_bank/models/verfy_user_status_type.dart';
import 'package:my_first_bank/ui/base_state.dart';
import 'package:my_first_bank/blocs/home_bloc.dart';
import 'package:my_first_bank/ui/no_available_page.dart';
import 'package:my_first_bank/ui/platform_widgets/platform_bottom.dart';
import 'package:my_first_bank/ui/platform_widgets/platform_checkbox.dart';
import 'package:my_first_bank/ui/platform_widgets/platform_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

bool isTextPasswordObscure = true;

class _HomePageState extends BaseState<HomePage, HomeBloc> {
  final FocusNode _passwordNode = FocusNode();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future<bool> rememberUserCheckBox;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  getBlocInstance() {
    return HomeBloc(Injector().provideAuthenticationUseCase());
  }

  @override
  void initState() {
    super.initState();
    _loadRememberUserName();
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var widgetsWidth = screenWidth * 0.8;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Center(
                child: Image.asset(ApplicationsAssets.logo),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Center(
                  child: Text(
                    l10n.signInText,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontSize: 18.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Material(
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                        hintText: 'Enter valid mail id as abc@gmail.com'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your secure password'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Container(
                    width: widgetsWidth,
                    child: PlatformTextField(
                      controller: _userController,
                      labelText: l10n.user,
                      textInputAction: TextInputAction.next,
                      autocorrect: false,
                      onSubmitted: (value) {
                        FocusScope.of(context).requestFocus(_passwordNode);
                      },
                      onChanged: (value) {
                        bloc.userSink.add(value);
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(
                          RegExp("[ ]"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: widgetsWidth,
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NoAvailablePage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Text(
                        l10n.forgotUserNameQuestion,
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: ApplicationColors().secondaryTextColor),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Center(
                  child: Container(
                    width: widgetsWidth,
                    child: StreamBuilder<bool>(
                      initialData: true,
                      stream: bloc.emptyFields,
                      builder: (context, emptyFieldsSnapshot) {
                        return PlatformTextField(
                          controller: _passwordController,
                          focusNode: _passwordNode,
                          labelText: l10n.password,
                          textInputAction: TextInputAction.done,
                          obscureText: isTextPasswordObscure,
                          suffix: IconButton(
                            onPressed: () {
                              setState(() {
                                isTextPasswordObscure = !isTextPasswordObscure;
                              });
                            },
                            icon: isTextPasswordObscure
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                          ),
                          onChanged: (value) {
                            bloc.passwordSink.add(value);
                          },
                          onSubmitted: (_) {
                            if (!emptyFieldsSnapshot.data) _signIn();
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: widgetsWidth,
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NoAvailablePage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        l10n.forgotUserPasswordQuestion,
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: ApplicationColors().secondaryTextColor),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Center(
                  child: Container(
                    width: widgetsWidth,
                    child: FutureBuilder<bool>(
                        future: rememberUserCheckBox,
                        initialData: false,
                        builder: (context, snapshot) {
                          return PlatformCheckbox(
                            value: snapshot.data,
                            text: Text(l10n.rememberMe),
                            onChanged: (value) async {
                              _changeRememberUse();
                            },
                          );
                        }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Container(
                    width: widgetsWidth,
                    child: StreamBuilder<bool>(
                      initialData: true,
                      stream: bloc.emptyFields,
                      builder: (context, emptyFieldsSnapshot) {
                        return StreamBuilder<bool>(
                            initialData: false,
                            stream: bloc.loading,
                            builder: (context, loadingSnapshot) {
                              return PlatformButton(
                                text: l10n.continueKey,
                                isLoading: loadingSnapshot.data,
                                onPressed:
                                    emptyFieldsSnapshot.data ? null : _signIn,
                              );
                            });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      l10n.noAccountQuestion,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NoAvailablePage()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          l10n.noAccountAction,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(color: Theme.of(context).buttonColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _loadRememberUserName() {
    rememberUserCheckBox = _prefs.then((SharedPreferences prefs) {
      var rememberUser = (prefs.getBool(
              SharedPreferencesKeys.IS_REMEMBERING_USER_NAME.toString()) ??
          false);
      if (rememberUser) {
        var userName =
            prefs.getString(SharedPreferencesKeys.USER_NAME.toString());
        _userController.text = userName;
        bloc.userSink.add(userName);
      }
      return rememberUser;
    });
  }

  Future<void> _changeRememberUse() async {
    final SharedPreferences prefs = await _prefs;
    final bool rememberUse = (prefs.getBool(
            SharedPreferencesKeys.IS_REMEMBERING_USER_NAME.toString()) ??
        false);
    setState(() {
      rememberUserCheckBox = prefs
          .setBool(SharedPreferencesKeys.IS_REMEMBERING_USER_NAME.toString(),
              !rememberUse)
          .then((bool success) {
        return !rememberUse;
      });
    });
  }

  void _signIn() {
    if (bloc.loading.value ?? false) {
      return;
    }
    FocusScope.of(context).requestFocus(FocusNode());
    var user = _userController.text.trim();
    var password = _passwordController.text.trim();
    var authenticationRequest = AuthenticationRequest(user, password);
    bloc.signIn(authenticationRequest).then((result) async {
      if (result.status == Status.success) {
        final SharedPreferences prefs = await _prefs;
        rememberUserCheckBox.then((value) {
          if (value ?? false) {
            prefs.setString(SharedPreferencesKeys.USER_NAME.toString(),
                _userController.text);
          }
        });

        _validateUserStatus(result.data.payload.response);
      } else {
        showDefaultAlert(
          message: 'result.error.message',
        );
      }
    });
  }

  void _validateUserStatus(AuthenticationResponse authenticationResponse) {
    if (authenticationResponse.token != null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        (route) => false,
      );
    } else {
      if (authenticationResponse.status ==
          VerifyUserStatusType.CONFIRMATION_PENDING) {
        _showAlertSignInFailed(message: l10n.authConfirmationPendingError);
        return;
      }

      if (authenticationResponse.status ==
          VerifyUserStatusType.RESETTING_PASSWORD) {
        _showAlertSignInFailed(message: l10n.authResettingPasswordError);
        return;
      }

      if (authenticationResponse.status ==
          VerifyUserStatusType.ERROR_EXPIRED_PASSWORD) {
        _showExpiredPassword(message: l10n.authResettingExpiredPassword);
        return;
      }

      _showAlertSignInFailed(message: l10n.authWrongCredentialsError);
    }
  }

  void _showExpiredPassword({
    String message,
  }) {
    showCustomAlert(
      title: l10n.defaultTitleError,
      icon: Icons.update,
      color: ApplicationColors().primarySwatch,
      message: message,
      positiveTextButton: l10n.accept,
      positiveOnPressed: _goToUnlockPasswordPage,
    );
  }

  void _showAlertSignInFailed({String message, bool isUserLocked}) {
    showCustomAlert(
      title: l10n.defaultTitleError,
      icon: Icons.error_outline,
      color: Colors.red,
      message: message,
      positiveTextButton: (isUserLocked ?? false) ? l10n.accept : l10n.accept,
      positiveOnPressed: () {
        (isUserLocked ?? false)
            ? _goToUnlockPasswordPage()
            : Navigator.of(context).pop();
      },
    );
  }

  void _goToUnlockPasswordPage() {
    Navigator.of(context).pop();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoAvailablePage()),
    );
  }
}
