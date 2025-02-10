import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:trick_crm_app/core/routes/routes.dart';
import 'package:trick_crm_app/features/home/logic/cubit/dashboard_cubit.dart';
import 'package:trick_crm_app/features/leads/lead-view/lead-view/logic/cubit/leads_view_cubit.dart';
import 'package:trick_crm_app/features/leads/leads/presentation/screens/leads_screen.dart';

import '../../features/auth/login/logic/cubit/login_cubit.dart';
import '../../features/auth/login/presentation/screens/login_screen.dart';
import '../../features/clients/clients/logic/cubit/clients_cubit.dart';
import '../../features/clients/clients/presentation/screen/clients.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/leads/lead-view/lead-view/presentation/screens/leads_view.dart';
import '../../features/leads/leads/logic/cubit/leads_cubit.dart';
import '../../features/splash/splash_screen.dart';
import '../api/api_service.dart';
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
      ),
      transitionDuration: const Duration(milliseconds: 1400),
    ),
    GetPage(
      name: RoutesNames.home,
      page: () => BlocProvider(
        create: (context) => DashboardCubit(getIt())..getDashboard(),
        child: const HomeScreen(),
      ),
      transitionDuration: const Duration(milliseconds: 1200),
    ),
    GetPage(
      name: RoutesNames.leads,
      page: () => BlocProvider(
        create: (context) => LeadsCubit(getIt<ApiService>())..getData(),
        child: const LeadsScreen(),
      ),
    ),
    GetPage(
      name: RoutesNames.leadsView,
      page: () => BlocProvider(
        create: (context) => LeadsViewCubit(getIt()),
        child: const LeadsView(),
      ),
    ),
    GetPage(
      name: RoutesNames.clients,
      page: () => BlocProvider(
        create: (context) => ClientsCubit(getIt<ApiService>())..getData(),
        child: const Clients(),
      ),
    ),
  ];
}
