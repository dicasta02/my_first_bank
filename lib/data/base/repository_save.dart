import 'package:my_first_bank/domain/base/repository.dart';
import 'package:my_first_bank/models/result.dart';

import 'base_source.dart';

mixin RepositorySaveAdapter<M, R> implements RepositorySave<M, R> {
  ApiSourcePost get apiSource;

  @override
  Future<Result<M>> save(R request) {
    return apiSource.post(request);
  }
}
