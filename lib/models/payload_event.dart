import 'package:my_first_bank/models/payload_header.dart';

class PayloadEvent<T> {
  PayloadHeaderResult header;
  dynamic body;
  T response;

  PayloadEvent(
    this.header,
    this.body,
  );

  factory PayloadEvent.fromJson(Map<String, dynamic> json) => PayloadEvent(
        json['header'] == null
            ? null
            : PayloadHeaderResult.fromJson(
                json['header'] as Map<String, dynamic>),
        json['body'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'header': header.toJson(),
        'body': body,
      };
}
