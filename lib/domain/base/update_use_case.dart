import 'package:my_first_bank/domain/base/repository.dart';
import 'package:my_first_bank/models/base_model.dart';

mixin UpdateUseCase<M extends BaseModel> {
  Future update(BaseModel M);
}

mixin UpdateUseCaseAdapter<M extends BaseModel> implements UpdateUseCase<M> {
  BaseRepository get repository;

  @override
  Future update(BaseModel M) {
    return (repository as RepositoryUpdate).update(M);
  }
}
