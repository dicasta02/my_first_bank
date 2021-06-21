import 'package:my_first_bank/models/payload_event.dart';

class Event<T> {
  String id;
  String commandId;
  String name;
  String status;
  PayloadEvent<T> payload;
  String scope;

  Event.empty();

  Event(
    this.id,
    this.commandId,
    this.name,
    this.status,
    this.scope,
  );

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        json['id'] as String,
        json['commandId'] as String,
        json['name'] as String,
        json['status'] as String,
        json['scope'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'commandId': commandId,
        'name': name,
        'status': status,
        'scope': scope,
      };
}
