import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/api/dio_factory.dart';
import 'package:trick_crm_app/features/leads/create-lead/logic/cubit/create_lead_cubit.dart';
import 'package:trick_crm_app/features/leads/data/repo/leads_repo.dart';
import 'package:trick_crm_app/features/leads/edit-lead/data/repo/edit_lead_repo.dart';

import '../../features/auth/login/data/repos/login_repo.dart';
import '../../features/auth/login/logic/cubit/login_cubit.dart';
import '../../features/home/data/repo/dashboard_repo.dart';
import '../../features/leads/create-lead/data/repo/create_lead_repo.dart';
import '../../features/leads/edit-lead/logic/cubit/edit_lead_cubit.dart';
import '../../features/leads/leads-view/data/repo/leads_view_repo.dart';
import '../../features/leads/leads-view/logic/cubit/leads_view_cubit.dart';
import '../../features/leads/logic/cubit/leads_cubit.dart';

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
  getIt.registerLazySingleton<LeadsCubit>(() => LeadsCubit(getIt<LeadsRepo>()));

  // leads view repo instance
  getIt.registerLazySingleton<LeadsViewRepo>(() => LeadsViewRepo(getIt()));
  getIt.registerLazySingleton<LeadsViewCubit>(
      () => LeadsViewCubit(getIt<LeadsViewRepo>()));

  // create lead instance
  getIt.registerLazySingleton<CreateLeadRepo>(() => CreateLeadRepo(getIt()));
  getIt.registerLazySingleton<CreateLeadCubit>(
      () => CreateLeadCubit(getIt<CreateLeadRepo>()));

  // Edit lead instance
  getIt.registerLazySingleton<EditLeadRepo>(() => EditLeadRepo(getIt()));
  getIt.registerLazySingleton<EditLeadCubit>(
      () => EditLeadCubit(getIt<EditLeadRepo>()));
}
