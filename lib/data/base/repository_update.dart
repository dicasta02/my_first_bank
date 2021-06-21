import 'package:my_first_bank/domain/base/repository.dart';
import 'package:my_first_bank/models/base_model.dart';

import 'base_source.dart';

mixin StorageRepositoryUpdateAdapter<M extends BaseModel>
    implements RepositoryUpdate<M> {
  DbSource get dbSource;

  @override
  Future update(BaseModel M) {
    return (dbSource as DbSourcePut).put(M);
  }
}
