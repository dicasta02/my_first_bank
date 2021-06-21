import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_first_bank/data_sourse/api/authentication_api_source.dart';
import 'package:my_first_bank/models/aunthentication_response.dart';
import 'package:my_first_bank/models/authetication_request.dart';
import 'package:my_first_bank/models/event.dart';
import 'package:my_first_bank/utils/connectivity/my_connectivity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

class MockMyConnectivity extends Mock implements MyConnectivity {}

void main() {
  MockClient _mockClient;
  MockMyConnectivity _myConnectivity;
  AuthenticationApiSourceAdapter _apiSource;

  var baseUrl = 'http://url';

  setUp(() {
    _mockClient = MockClient();
    _myConnectivity = MockMyConnectivity();
    _apiSource = AuthenticationApiSourceAdapter(
      baseUrl,
      _myConnectivity,
      client: _mockClient,
    );
    when(_myConnectivity.isConnected()).thenAnswer((_) async => true);
    SharedPreferences.setMockInitialValues({});
  });

  test(
      'post() return AuthenticationResponse if the http call completes successfully',
      () async {
    var request = AuthenticationRequest('', '');
    var url = '$baseUrl/security/command';
    when(_mockClient.post(url,
            body: anyNamed('body'), headers: anyNamed('headers')))
        .thenAnswer(
            (_) async => http.Response('[{"payload": {"body":{}}}]', 200));

    var result = await _apiSource.post(request);

    verify(_myConnectivity.isConnected());
    expect(result.data, isInstanceOf<Event<AuthenticationResponse>>());
  });
}
