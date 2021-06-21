import 'package:my_first_bank/domain/base/repository.dart';
import 'package:my_first_bank/models/base_model.dart';

import 'base_source.dart';

mixin StorageRepositoryStreamAllAdapter<M extends BaseModel>
    implements RepositoryStreamAll<M> {
  DbSource get dbSource;

  @override
  Stream<List<M>> streamAll([Map params]) {
    return (dbSource as DbSourceGetAll).getAll(params);
  }
}
