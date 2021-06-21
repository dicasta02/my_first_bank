import 'package:flutter/material.dart';
import 'package:my_first_bank/app/settings/app_localizations.dart';
import 'package:my_first_bank/blocs/provider/bloc.dart';
import 'package:my_first_bank/blocs/provider/provider.dart';
import 'package:my_first_bank/ui/platform_widgets/platform_alert.dart';

abstract class BaseState<T extends StatefulWidget, K extends Bloc>
    extends State<T> {
  AppLocalizations l10n;
  K bloc;

  @override
  void initState() {
    super.initState();
    bloc = Provider.of<K>(getBlocInstance);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    l10n = AppLocalizations.of(context);
  }

  @override
  void dispose() {
    Provider.dispose<K>();
    super.dispose();
  }

  K getBlocInstance();

  void showDefaultAlert(
      {String title, String message, Function positiveOnPressed}) {
    title = title ?? l10n.defaultTitleError;

    Alert.showPlatformDialog(
      context: context,
      title: title,
      content: l10n.getLocalizedValue(message),
      positiveTextButton: l10n.accept,
      positiveOnPressed: () {
        Navigator.of(context).pop();
        if (positiveOnPressed != null) {
          positiveOnPressed();
        }
      },
    );
  }

  Future<T> showCustomAlert<T>({
    @required String title,
    @required IconData icon,
    @required Color color,
    String message,
    String positiveTextButton,
    final VoidCallback positiveOnPressed,
    String negativeTextButton,
    final VoidCallback negativeOnPressed,
    TextAlign textBodyAlign,
  }) {
    return Alert.showCustomPlatformDialog<T>(
        context: context,
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                color: color,
                size: 34.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: color,
                        fontSize: 18,
                      ),
                ),
              ),
              message == null
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                      child: Text(
                        message,
                        textAlign: textBodyAlign ?? TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(color: Colors.grey),
                      ),
                    ),
            ],
          ),
        ),
        positiveTextButton: positiveTextButton,
        positiveOnPressed: positiveOnPressed,
        negativeTextButton: negativeTextButton,
        negativeOnPressed: negativeOnPressed);
  }
}
