import 'package:my_first_bank/domain/base/repository.dart';
import 'package:my_first_bank/models/base_model.dart';
import 'package:my_first_bank/models/result.dart';

import 'base_source.dart';

mixin StorageRepositoryGetAllAdapter<M extends BaseModel>
    implements RepositoryGetAll<M> {
  ApiSource get apiSource;
  DbSource get dbSource;

  @override
  Future<Result<List<M>>> getAll([Map params]) {
    return (apiSource as ApiSourceGetAll).getAll(params).then((result) async {
      if (result.data != null) {
        await (dbSource as DbSourceSaveAll).saveAll(result.data);
      }
      return result;
    });
  }
}

mixin RepositoryGetAllAdapter<M extends BaseModel>
    implements RepositoryGetAll<M> {
  ApiSourceGetAll get apiSource;

  @override
  Future<Result<List<M>>> getAll([Map params]) {
    return apiSource.getAll(params);
  }
}
