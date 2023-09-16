import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class Network {
  Future<bool> isConnected();
}

class NetworkInfo implements Network {
  InternetConnectionChecker _internetConnection;
  NetworkInfo(this._internetConnection);
  @override
  Future<bool> isConnected() {
     _internetConnection = InternetConnectionChecker();
    return _internetConnection.hasConnection;
  }
}
