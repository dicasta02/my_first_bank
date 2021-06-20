import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    Intl.defaultLocale = locale.languageCode;
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

class AppLocalizations {
  AppLocalizations(this.locale);

  Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  set localizedValues(Map<String, dynamic> value) {
    if (value == null) {
      value = {};
    }
    _localizedValues = value;
  }

  static Map<String, dynamic> _localizedValues = {
    'firstApp': 'Mi Banco',
    'accept': 'Aceptar',
    'landingTitle': '¡Empieza a disfrutar de tu Banco!',
    'signInText': 'Iniciar Sesion',
    'createAcount': 'Crear Cuenta',
    'home': 'Login',
    'services': 'Otros Servicios',
  };

  String getLocalizedValue(String key) {
    if (key != null && _localizedValues.containsKey(key)) {
      return _localizedValues[key];
    }
    return key;
  }

  String get firstApp => getLocalizedValue('firstApp');

  String get accept => getLocalizedValue('accept');

  String get landingTitle => getLocalizedValue('landingTitle');

  String get signInText => getLocalizedValue('signInText');

  String get createAcount => getLocalizedValue('createAcount');

  String get home => getLocalizedValue('home');

  String get services => getLocalizedValue('services');
}
