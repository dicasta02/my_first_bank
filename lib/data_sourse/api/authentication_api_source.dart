import 'package:http/http.dart' as http;
import 'package:my_first_bank/data/authentication_repository.dart';
import 'package:my_first_bank/data_sourse/api/api_source.dart';
import 'package:my_first_bank/models/aunthentication_response.dart';
import 'package:my_first_bank/models/authetication_request.dart';
import 'package:my_first_bank/models/coman.dart';
import 'package:my_first_bank/models/event.dart';
import 'package:my_first_bank/models/result.dart';
import 'package:my_first_bank/utils/connectivity/my_connectivity.dart';

class AuthenticationApiSourceAdapter extends ApiSource
    implements AuthenticationApiSource {
  AuthenticationApiSourceAdapter(
    String baseUrl,
    MyConnectivity connectivity, {
    http.Client client,
  }) : super(baseUrl, client ?? http.Client(), connectivity);

  @override
  Future<Result<Event<AuthenticationResponse>>> post(
      AuthenticationRequest request) {
    var command = Command(
      'security.command.user.signin',
      getTraceability(),
      request.toJson(),
    );
    var url = '$baseUrl/security/command';
    return postApi<Event<AuthenticationResponse>>(url, command.toJson(),
        (value) {
      value = (value as List)[0];
      var event = Event<AuthenticationResponse>.fromJson(value);
      event.payload.response =
          AuthenticationResponse.fromJson(event.payload.body);
      return event;
    });
  }
}
