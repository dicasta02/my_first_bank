class SharedPreferencesKeys {
  final _value;

  const SharedPreferencesKeys._internal(this._value);

  String toString() => _value;

  static const IS_REMEMBERING_USER_NAME =
      SharedPreferencesKeys._internal('IS_REMEMBERING_USER_NAME');
  static const USER_NAME = SharedPreferencesKeys._internal('USER_NAME');

  static final _values = <String, SharedPreferencesKeys>{
    'IS_REMEMBERING_USER_NAME': SharedPreferencesKeys.IS_REMEMBERING_USER_NAME,
    'USER_NAME': SharedPreferencesKeys.USER_NAME,
  };

  static SharedPreferencesKeys getByName(String type) {
    return _values[type];
  }
}
