import 'package:my_first_bank/domain/base/repository.dart';
import 'package:my_first_bank/models/base_model.dart';
import 'package:my_first_bank/models/result.dart';

import 'base_source.dart';

mixin StorageRepositoryGetAdapter<M extends BaseModel>
    implements RepositoryGet<M> {
  ApiSource get apiSource;
  DbSource get dbSource;

  @override
  Future<Result<M>> get() {
    return (apiSource as ApiSourceGet).get().then((result) async {
      if (result.data != null) {
        await (dbSource as DbSourceSave).save(result.data);
      }
      return result;
    });
  }
}

mixin RepositoryGetAdapter<M extends BaseModel> implements RepositoryGet<M> {
  ApiSourceGet get apiSource;

  @override
  Future<Result<M>> get() {
    return apiSource.get();
  }
}
