import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:trick_crm_app/core/routes/routes.dart';

import '../../features/auth/login/logic/cubit/login_cubit.dart';
import '../../features/auth/login/presentation/screens/login_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../di/dependency_injection.dart';

/// App Router class for the app
abstract class AppRouter {
  static final List<GetPage> routes = [
    GetPage(name: RoutesNames.splashScreen, page: () => const SplashScreen()),
    GetPage(
        name: RoutesNames.login,
        page: () => BlocProvider(
              create: (context) => getIt<LoginCubit>(),
              child: const LoginScreen(),
            )),
    GetPage(name: RoutesNames.home, page: () => const HomeScreen()),
  ];
}
