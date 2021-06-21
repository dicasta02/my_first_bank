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
    'noAvailable': 'Pantalla en Construcción',
    'back': 'Regresar',
    'home': 'Login',
    'user': 'Usuario',
    'password': 'Contraseña',
    'forgotUserNameQuestion': '¿Olvidaste tu Usuario?',
    'forgotUserPasswordQuestion': '¿Olvidaste tu contraseña?',
    'emptyFields': 'emptyFields',
    'rememberMe': 'Recuérdame',
    'continue': 'Continuar',
    'noAccountQuestion': '¿No tienes cuenta?',
    'noAccountAction': 'Regístrate',
    'cancel': 'Cancelar',
    'defaultTitleError': 'Error',
    'authConfirmationPendingError':
        'No es posible ingresar, el usuario está pendiente de confirmación.',
    'authResettingPasswordError':
        'No es posible ingresar, es necesario que actualices la contraseña.',
    'authWrongCredentialsError':
        'Verifica tus credenciales, usuario y/o contraseña no válida.',
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

  String get noAvailable => getLocalizedValue('noAvailable');

  String get back => getLocalizedValue('back');

  String get home => getLocalizedValue('home');

  String get user => getLocalizedValue('user');

  String get forgotUserNameQuestion =>
      getLocalizedValue('forgotUserNameQuestion');

  String get forgotUserPasswordQuestion =>
      getLocalizedValue('forgotUserPasswordQuestion');

  String get password => getLocalizedValue('password');

  String get rememberMe => getLocalizedValue('rememberMe');

  String get continueKey => getLocalizedValue('continue');

  String get noAccountQuestion => getLocalizedValue('noAccountQuestion');

  String get noAccountAction => getLocalizedValue('noAccountAction');

  String get cancel => getLocalizedValue('cancel');

  String get defaultTitleError => getLocalizedValue('defaultTitleError');

  String get authConfirmationPendingError =>
      getLocalizedValue('authConfirmationPendingError');

  String get authResettingPasswordError =>
      getLocalizedValue('authResettingPasswordError');

  String get authResettingExpiredPassword =>
      getLocalizedValue('authResettingExpiredPassword');

  String get authWrongCredentialsError =>
      getLocalizedValue('authWrongCredentialsError');

  String get services => getLocalizedValue('services');
}
