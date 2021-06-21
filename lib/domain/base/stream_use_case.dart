import 'package:my_first_bank/domain/base/repository.dart';
import 'package:my_first_bank/models/base_model.dart';

mixin StreamUseCase<M extends BaseModel> {
  Stream<M> stream();
}

mixin StreamUseCaseAdapter<M extends BaseModel> implements StreamUseCase<M> {
  BaseRepository get repository;

  @override
  Stream<M> stream() {
    return (repository as RepositoryStream).stream();
  }
}
