import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_first_bank/data/authentication_repository.dart';

class MockAuthenticationApiSource extends Mock
    implements AuthenticationApiSource {}

void main() {
  MockAuthenticationApiSource _apiSource;
  AuthenticationRepositoryAdapter _repository;

  setUp(() {
    _apiSource = MockAuthenticationApiSource();
    _repository = AuthenticationRepositoryAdapter(_apiSource);
  });
}
