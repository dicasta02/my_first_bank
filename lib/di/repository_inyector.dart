import 'package:my_first_bank/data/authentication_repository.dart';
import 'package:my_first_bank/di/data_source_inyector.dart';
import 'package:my_first_bank/domain/authetication_use_case.dart';

class RepositoryInjector {
  static RepositoryInjector _singleton;

  factory RepositoryInjector() {
    if (_singleton == null) {
      _singleton = RepositoryInjector._();
    }
    return _singleton;
  }

  RepositoryInjector._();

  AuthenticationRepository provideAuthenticationRepository() {
    return AuthenticationRepositoryAdapter(
      DataSourceInjector().provideAuthenticationApiSource(),
    );
  }
}
