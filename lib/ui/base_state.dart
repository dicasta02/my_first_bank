import 'package:flutter/material.dart';
import 'package:my_first_bank/app/settings/app_localizations.dart';
import 'package:my_first_bank/blocs/provider/bloc.dart';
import 'package:my_first_bank/blocs/provider/provider.dart';

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
}
