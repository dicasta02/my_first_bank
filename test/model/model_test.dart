import 'package:my_first_bank/models/base_model.dart';

class Model with BaseModel {
  String id;

  Model(this.id);

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
