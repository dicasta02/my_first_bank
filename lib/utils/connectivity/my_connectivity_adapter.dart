import 'dart:developer';
import 'dart:io';

import 'package:connectivity/connectivity.dart';

import 'my_connectivity.dart';

class MyConnectivityAdapter implements MyConnectivity {
  @override
  Future<bool> isConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          return true;
        }
      } on SocketException catch (e) {
        log(e.message, name: 'isConnected', error: e);
      }
    }
    return false;
  }
}
