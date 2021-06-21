import 'package:my_first_bank/domain/base/repository.dart';
import 'package:my_first_bank/models/aunthentication_response.dart';
import 'package:my_first_bank/models/authetication_request.dart';
import 'package:my_first_bank/models/event.dart';
import 'package:my_first_bank/models/result.dart';

mixin AuthenticationRepository
    on RepositorySave<Event<AuthenticationResponse>, AuthenticationRequest> {}
mixin AuthenticationUseCase {
  Future<Result<Event<AuthenticationResponse>>> signIn(
      AuthenticationRequest request);
}

class AuthenticationUseCaseAdapter implements AuthenticationUseCase {
  final AuthenticationRepository repository;

  AuthenticationUseCaseAdapter(this.repository);

  @override
  Future<Result<Event<AuthenticationResponse>>> signIn(
      AuthenticationRequest request) {
    return repository.save(request).then((result) {
      if (result.status == Status.success) {}
      return result;
    });
  }
}
