import 'package:my_first_bank/data/base/base_source.dart';
import 'package:my_first_bank/data/base/repository_save.dart';
import 'package:my_first_bank/domain/authetication_use_case.dart';
import 'package:my_first_bank/models/aunthentication_response.dart';
import 'package:my_first_bank/models/authetication_request.dart';
import 'package:my_first_bank/models/event.dart';

mixin AuthenticationApiSource
    on ApiSourcePost<Event<AuthenticationResponse>, AuthenticationRequest> {}
mixin AuthenticationDbSource
    on
        DbSourceSave<AuthenticationResponse>,
        DbSourceGet<AuthenticationResponse> {}

class AuthenticationRepositoryAdapter
    with
        RepositorySaveAdapter<Event<AuthenticationResponse>,
            AuthenticationRequest>
    implements
        AuthenticationRepository {
  final AuthenticationApiSource apiSource;

  AuthenticationRepositoryAdapter(this.apiSource);
}
