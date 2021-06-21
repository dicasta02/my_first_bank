class AuthenticationRequest {
  String user;
  String password;

  AuthenticationRequest(
    this.user,
    this.password,
  );

  factory AuthenticationRequest.fromJson(Map<String, dynamic> json) =>
      AuthenticationRequest(
        json['username'] as String,
        json['password'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'username': user,
        'password': password,
      };
}
