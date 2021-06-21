import 'package:my_first_bank/models/base_model.dart';
import 'package:my_first_bank/models/result.dart';

mixin BaseRepository {}

mixin RepositoryStreamAll<M extends BaseModel> on BaseRepository {
  Stream<List<M>> streamAll([Map params]);
}
mixin RepositoryStream<M extends BaseModel> on BaseRepository {
  Stream<M> stream();
}
mixin RepositoryGetAll<M extends BaseModel> on BaseRepository {
  Future<Result<List<M>>> getAll([Map params]);
}
mixin RepositoryGet<M extends BaseModel> on BaseRepository {
  Future<Result<M>> get();
}
mixin RepositoryGetById<M extends BaseModel> on BaseRepository {
  Future<Result<M>> getById(String id, [Map params]);
}
mixin RepositoryStreamById<M extends BaseModel> on BaseRepository {
  Stream<M> streamById(String id, [Map params]);
}
mixin RepositorySave<M, R> on BaseRepository {
  Future<Result<M>> save(R request);
}
mixin RepositoryUpdate<M extends BaseModel> on BaseRepository {
  Future update(BaseModel M);
}
