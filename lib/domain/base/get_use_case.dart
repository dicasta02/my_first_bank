import 'package:my_first_bank/domain/base/repository.dart';
import 'package:my_first_bank/models/base_model.dart';
import 'package:my_first_bank/models/result.dart';

mixin GetUseCase<M extends BaseModel> {
  Future<Result<M>> get();
}

mixin GetUseCaseAdapter<M extends BaseModel> implements GetUseCase<M> {
  BaseRepository get repository;

  @override
  Future<Result<M>> get() {
    return (repository as RepositoryGet).get();
  }
}
