import 'package:my_first_bank/domain/base/repository.dart';
import 'package:my_first_bank/models/base_model.dart';

mixin StreamByIdUseCase<M extends BaseModel> {
  Stream<M> streamById(String id, [Map params]);
}

mixin StreamByIdUseCaseAdapter<M extends BaseModel>
    implements StreamByIdUseCase<M> {
  BaseRepository get repository;

  @override
  Stream<M> streamById(String id, [Map params]) {
    return (repository as RepositoryStreamById).streamById(id, params);
  }
}
