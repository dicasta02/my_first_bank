import 'package:my_first_bank/domain/base/repository.dart';
import 'package:my_first_bank/models/base_model.dart';
import 'package:my_first_bank/models/result.dart';

mixin GetAllUseCase<M extends BaseModel> {
  Future<Result<List<M>>> getAll([Map params]);
}

mixin GetAllUseCaseAdapter<M extends BaseModel> implements GetAllUseCase<M> {
  BaseRepository get repository;

  @override
  Future<Result<List<M>>> getAll([Map params]) {
    return (repository as RepositoryGetAll).getAll(params);
  }
}
