import 'package:my_first_bank/domain/base/repository.dart';
import 'package:my_first_bank/models/base_model.dart';
import 'package:my_first_bank/models/result.dart';

import 'base_source.dart';

mixin StorageRepositoryGetByIdAdapter<M extends BaseModel>
    implements RepositoryGetById<M> {
  ApiSource get apiSource;
  DbSource get dbSource;

  @override
  Future<Result<M>> getById(String id, [Map params]) {
    return (apiSource as ApiSourceGetById)
        .getById(id, params)
        .then((result) async {
      if (result.data != null) {
        await (dbSource as DbSourcePut).put(result.data);
      }
      return result;
    });
  }
}

mixin RepositoryGetByIdAdapter<M extends BaseModel>
    implements RepositoryGetById<M> {
  ApiSourceGetById get apiSource;

  @override
  Future<Result<M>> getById(String id, [Map params]) {
    return apiSource.getById(id, params);
  }
}
