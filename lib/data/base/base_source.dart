import 'package:my_first_bank/models/base_model.dart';
import 'package:my_first_bank/models/result.dart';

mixin ApiSource {}

mixin ApiSourceGetAll<T extends BaseModel> on ApiSource {
  Future<Result<List<T>>> getAll([Map params]);
}

mixin ApiSourceGet<T extends BaseModel> on ApiSource {
  Future<Result<T>> get();
}

mixin ApiSourceGetById<T extends BaseModel> on ApiSource {
  Future<Result<T>> getById(String id, [Map params]);
}

mixin ApiSourcePost<T, R> on ApiSource {
  Future<Result<T>> post(R request);
}

mixin DbSource {}

mixin DbSourceGetAll<T extends BaseModel> on DbSource {
  Stream<List<T>> getAll([Map params]);
}

mixin DbSourceGet<T extends BaseModel> on DbSource {
  Stream<T> get();
}

mixin DbSourceGetById<T extends BaseModel> on DbSource {
  Stream<T> getById(String id);
}

mixin DbSourceSaveAll<T extends BaseModel> on DbSource {
  Future saveAll(List<T> items);
}

mixin DbSourceUpdateAll<T extends BaseModel> on DbSource {
  Future updateAll(List<T> items);
}

mixin DbSourceSave<T extends BaseModel> on DbSource {
  Future save(T item);
}

mixin DbSourcePut<T extends BaseModel> on DbSource {
  Future put(T item);
}

mixin DbSourceDeleteById<T extends BaseModel> on DbSource {
  Future deleteById(String id);
}
