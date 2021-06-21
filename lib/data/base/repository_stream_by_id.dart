import 'package:my_first_bank/domain/base/repository.dart';
import 'package:my_first_bank/models/base_model.dart';

import 'base_source.dart';

mixin StorageRepositoryStreamByIdAdapter<M extends BaseModel>
    implements RepositoryStreamById<M> {
  DbSource get dbSource;

  @override
  Stream<M> streamById(String id, [Map params]) {
    return (dbSource as DbSourceGetById).getById(id);
  }
}
