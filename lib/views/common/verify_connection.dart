import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> verifyConnection() async {
  final connectivityResult = await Connectivity().checkConnectivity();

  if (connectivityResult == ConnectivityResult.none) {
    return Future<bool>.value(false);
    ;
  } else {
    return Future<bool>.value(true);
  }
}
