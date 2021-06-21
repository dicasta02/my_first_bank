import 'package:my_first_bank/models/base_model.dart';
import 'package:my_first_bank/models/verfy_user_status_type.dart';

class AuthenticationResponse with BaseModel {
  String token;
  VerifyUserStatusType status;
  String firstLogin;
  String engineUserId;

  AuthenticationResponse({
    this.token,
    this.status,
    this.firstLogin,
    this.engineUserId,
  });

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      AuthenticationResponse(
        token: json['token'] as String,
        status: VerifyUserStatusType.getByName(json['status'] as String),
        firstLogin: json['firstLogin'] as String,
        engineUserId: json['engineUserId'] as String,
      );

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'token': token,
        'status': status.toString(),
        'firstLogin': firstLogin,
        'engineUserId': engineUserId
      };

  @override
  String get id => token;
}
