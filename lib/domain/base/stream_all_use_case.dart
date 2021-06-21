import 'package:my_first_bank/domain/base/repository.dart';
import 'package:my_first_bank/models/base_model.dart';

mixin StreamAllUseCase<M extends BaseModel> {
  Stream<List<M>> streamAll([Map params]);
}

mixin StreamAllUseCaseAdapter<M extends BaseModel>
    implements StreamAllUseCase<M> {
  BaseRepository get repository;

  @override
  Stream<List<M>> streamAll([Map params]) {
    return (repository as RepositoryStreamAll).streamAll(params);
  }
}
