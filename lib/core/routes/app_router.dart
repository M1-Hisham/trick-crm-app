import 'package:get/route_manager.dart';

import '../../features/auth/login/login_screen.dart';
import '../../features/splash/splash_screen.dart';
import 'routes.dart';

/// App Router class for the app
// create a class for the app router with getters and setters for the routes
abstract class AppRouter {
  static final List<GetPage> routes = [
    GetPage(name: RoutesNames.splashScreen, page: () => const SplashScreen()),
    GetPage(name: RoutesNames.login, page: () => const LoginScreen()),
  ];
}
