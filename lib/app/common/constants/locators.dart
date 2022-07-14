import '../base/service_locator.dart';
import '../cache/cache_service.dart';
import '../http/http_service_impl.dart';
import '../navigation/navigation_service.dart';
import '../network/network_service.dart';
import '../responsive/responsive_service.dart';

class Locators {
  static final NavigationService navigation =
      sl<NavigationService>();

  static final ResponsiveService responsive =
      sl<ResponsiveService>();

  static final CacheService cache = sl<CacheService>();

  static final NetworkService network = sl<NetworkService>();

  static final HttpServiceImpl http = sl<HttpServiceImpl>();
}
