import 'package:connectivity_plus/connectivity_plus.dart';
import 'function_response.dart';

import '../service_locator.dart';

class ConnectivityHelper {
  Future<FunctionResponse> checkInternetConnection() async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      var _connectivityResult = await (Connectivity().checkConnectivity());

      if (_connectivityResult == ConnectivityResult.mobile) {
        _fResponse.passed();
      } else if (_connectivityResult == ConnectivityResult.wifi) {
        _fResponse.passed();
      } else {
        _fResponse.failed();
        _fResponse.message = 'No internet connection Available';
      }
    } catch (e) {
      _fResponse.failed();
      _fResponse.message = 'Error checking internet connection : $e';
    }

    return _fResponse;
  }
}
