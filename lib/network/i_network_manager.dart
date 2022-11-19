import '../models/network_result.dart';

typedef NetworkCallback = void Function(NetworkResult result);

abstract class INetworkManager {
  void handleNetworkChange(NetworkCallback onChange);
  void dispose();
}
