import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkIfnoImpl implements NetworkInfo {
  InternetConnection internetConnection;

  NetworkIfnoImpl({
    required this.internetConnection,
  });

  @override
  Future<bool> get isConnected async =>
      await internetConnection.hasInternetAccess;
}
