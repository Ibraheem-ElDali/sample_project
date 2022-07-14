/// interface is responsible for checking whether the device is connected
/// to the Internet or not

abstract class NetworkService {
  Future<bool> get isConnected;
}
