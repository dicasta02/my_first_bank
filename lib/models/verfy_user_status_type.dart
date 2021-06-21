class VerifyUserStatusType {
  final _value;

  const VerifyUserStatusType._internal(this._value);

  String toString() => _value;

  static const NOT_EXISTS = VerifyUserStatusType._internal('NOT_EXISTS');
  static const UNREGISTERED = VerifyUserStatusType._internal('UNREGISTERED');
  static const CONFIRMATION_PENDING =
      VerifyUserStatusType._internal('CONFIRMATION_PENDING');
  static const DISABLED = VerifyUserStatusType._internal('DISABLED');
  static const ACTIVE = VerifyUserStatusType._internal('ACTIVE');
  static const RESETTING_PASSWORD =
      VerifyUserStatusType._internal('RESETTING_PASSWORD');
  static const ERROR_EXPIRED_PASSWORD =
      VerifyUserStatusType._internal('ERROR_EXPIRED_PASSWORD');
  static const FORCE_CHANGE_PASSWORD =
      VerifyUserStatusType._internal('FORCE_CHANGE_PASSWORD');
  static const WRONG_CREDENTIALS =
      VerifyUserStatusType._internal('WRONG_CREDENTIALS');
  static const USER_IS_LOCKED =
      VerifyUserStatusType._internal('USER_IS_LOCKED');
  static const EMAIL_NOT_EXISTS =
      VerifyUserStatusType._internal('EMAIL_NOT_EXISTS');

  static final _values = <String, VerifyUserStatusType>{
    'NOT_EXISTS': VerifyUserStatusType.NOT_EXISTS,
    'UNREGISTERED': VerifyUserStatusType.UNREGISTERED,
    'RESETTING_PASSWORD': VerifyUserStatusType.RESETTING_PASSWORD,
    'ERROR_EXPIRED_PASSWORD': VerifyUserStatusType.ERROR_EXPIRED_PASSWORD,
    'FORCE_CHANGE_PASSWORD': VerifyUserStatusType.FORCE_CHANGE_PASSWORD,
    'CONFIRMATION_PENDING': VerifyUserStatusType.CONFIRMATION_PENDING,
    'DISABLED': VerifyUserStatusType.DISABLED,
    'ACTIVE': VerifyUserStatusType.ACTIVE,
    'WRONG_CREDENTIALS': VerifyUserStatusType.WRONG_CREDENTIALS,
    'USER_IS_LOCKED': VerifyUserStatusType.USER_IS_LOCKED,
    'EMAIL_NOT_EXISTS': VerifyUserStatusType.EMAIL_NOT_EXISTS,
  };

  static VerifyUserStatusType getByName(String type) {
    return _values[type];
  }
}
