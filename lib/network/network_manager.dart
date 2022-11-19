import 'dart:async';
import 'dart:io';

import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../models/network_result.dart';
import 'i_network_manager.dart';

class NetworkManager extends INetworkManager {
  late final InternetConnectionChecker _connectionChecker;
  StreamSubscription<InternetConnectionStatus>? _subscription;

  NetworkManager() {
    _connectionChecker = InternetConnectionChecker.createInstance(
      checkInterval: Duration(seconds: Platform.isIOS ? 2 : 3),
    );
  }

  @override
  void handleNetworkChange(NetworkCallback onChange) {
    _subscription = _connectionChecker.onStatusChange.listen((event) {
      onChange.call(
        NetworkResult.checkConnectivityResult(event),
      );
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
  }
}
