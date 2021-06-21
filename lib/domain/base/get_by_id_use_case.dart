import 'package:my_first_bank/domain/base/repository.dart';
import 'package:my_first_bank/models/base_model.dart';
import 'package:my_first_bank/models/result.dart';

mixin GetByIdUseCase<M extends BaseModel> {
  Future<Result<M>> getById(String id, [Map params]);
}

mixin GetByIdUseCaseAdapter<M extends BaseModel> implements GetByIdUseCase<M> {
  BaseRepository get repository;

  @override
  Future<Result<M>> getById(String id, [Map params]) {
    return (repository as RepositoryGetById).getById(id, params);
  }
}
