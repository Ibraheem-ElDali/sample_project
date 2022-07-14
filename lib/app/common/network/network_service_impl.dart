import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'network_service.dart';

class NetworkServiceImpl implements NetworkService {
  NetworkServiceImpl(this.connectionChecker);
  final InternetConnectionChecker connectionChecker;

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
