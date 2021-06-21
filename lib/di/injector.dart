import 'package:my_first_bank/di/repository_inyector.dart';
import 'package:my_first_bank/domain/authetication_use_case.dart';

class Injector {
  static Injector _singleton;

  factory Injector() {
    if (_singleton == null) {
      _singleton = Injector._();
    }
    return _singleton;
  }

  Injector._();

  AuthenticationUseCase provideAuthenticationUseCase() {
    return AuthenticationUseCaseAdapter(
      RepositoryInjector().provideAuthenticationRepository(),
    );
  }
}
