class PayloadHeaderResult {
  String code;
  String message;

  PayloadHeaderResult(
    this.code,
    this.message,
  );

  factory PayloadHeaderResult.fromJson(Map<String, dynamic> json) =>
      PayloadHeaderResult(
        json['code'] as String,
        json['message'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'message': message,
      };
}
