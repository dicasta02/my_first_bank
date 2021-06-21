import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_first_bank/domain/authetication_use_case.dart';
import 'package:my_first_bank/models/aunthentication_response.dart';
import 'package:my_first_bank/models/authetication_request.dart';
import 'package:my_first_bank/models/event.dart';
import 'package:my_first_bank/models/payload_event.dart';
import 'package:my_first_bank/models/result.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  MockAuthenticationRepository _repository;
  AuthenticationUseCaseAdapter _useCase;

  setUp(() {
    _repository = MockAuthenticationRepository();
    _useCase = AuthenticationUseCaseAdapter(_repository);
  });

  test('signIn() should return result from repository and save response',
      () async {
    var request = AuthenticationRequest('user', 'password');
    var response = Event<AuthenticationResponse>.empty();
    response.payload = PayloadEvent<AuthenticationResponse>(null, null)
      ..response = AuthenticationResponse();
    var expected = Result<Event<AuthenticationResponse>>.success(response);
    when(_repository.save(request)).thenAnswer((_) async => expected);

    var result = await _useCase.signIn(request);

    verify(_repository.save(request));
    expect(result, expected);
    expect(result.data, response);
    expect(result.status, Status.success);
  });
}
