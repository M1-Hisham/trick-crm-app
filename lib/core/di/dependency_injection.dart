import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/api/dio_factory.dart';
import 'package:trick_crm_app/features/home/logic/cubit/dashboard_cubit.dart';
import 'package:trick_crm_app/features/leads/data/repo/leads_repo.dart';

import '../../features/auth/login/data/repos/login_repo.dart';
import '../../features/auth/login/logic/cubit/login_cubit.dart';
import '../../features/home/data/repo/dashboard_repo.dart';

/// This is the dependency injection file for the app.
final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio Instance
  Dio dio = DioFactory.getDio();
  // Api Service Instance
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login repo & login cubit instance
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // dashboard repo instance
  getIt.registerLazySingleton<DashboardRepo>(() => DashboardRepo(getIt()));

  // leads repo instance
  getIt.registerLazySingleton<LeadsRepo>(() => LeadsRepo(getIt()));
}
