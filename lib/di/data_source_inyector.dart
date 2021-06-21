import 'package:my_first_bank/data/authentication_repository.dart';
import 'package:my_first_bank/data_sourse/api/authentication_api_source.dart';
import 'package:my_first_bank/utils/connectivity/my_connectivity.dart';
import 'package:my_first_bank/utils/connectivity/my_connectivity_adapter.dart';

class DataSourceInjector {
  static DataSourceInjector _singleton;
  MyConnectivity _myConnectivity;

  factory DataSourceInjector() {
    if (_singleton == null) {
      _singleton = DataSourceInjector._();
    }
    return _singleton;
  }

  DataSourceInjector._() {
    _myConnectivity = MyConnectivityAdapter();
  }
  AuthenticationApiSource provideAuthenticationApiSource() {
    return AuthenticationApiSourceAdapter(
      'www.mytext.com/',
      _myConnectivity,
    );
  }
}
