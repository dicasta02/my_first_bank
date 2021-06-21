import 'package:my_first_bank/domain/base/repository.dart';
import 'package:my_first_bank/models/base_model.dart';

import 'base_source.dart';

mixin StorageRepositoryStreamAdapter<M extends BaseModel>
    implements RepositoryStream<M> {
  DbSource get dbSource;

  @override
  Stream<M> stream() {
    return (dbSource as DbSourceGet).get();
  }
}
