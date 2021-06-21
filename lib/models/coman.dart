class Command {
  String name;
  Map<String, String> traceability;
  dynamic payload;

  Command(
    this.name,
    this.traceability,
    this.payload,
  );

  factory Command.fromJson(Map<String, dynamic> json) => Command(
        json['name'] as String,
        json['traceability'] == null
            ? null
            : (json['traceability'] as Map<String, dynamic>)
                .map((k, v) => MapEntry(k, v as String)),
        json['payload'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'traceability': traceability,
        'payload': payload,
      };
}
