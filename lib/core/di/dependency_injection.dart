import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/api/dio_factory.dart';
import 'package:trick_crm_app/features/leads/create-lead/logic/cubit/create_lead_cubit.dart';
import 'package:trick_crm_app/features/leads/lead-view/edit-lead/data/repo/edit_lead_repo.dart';

import '../../features/auth/login/data/repos/login_repo.dart';
import '../../features/auth/login/logic/cubit/login_cubit.dart';
import '../../features/home/data/repo/dashboard_repo.dart';
import '../../features/leads/lead-view/create-attachment/data/repo/create_attachment_repo.dart';
import '../../features/leads/lead-view/create-attachment/logic/cubit/create_attachment_cubit.dart';
import '../../features/leads/lead-view/create-lead-meeting/data/repo/create_lead_meeting_repo.dart';
import '../../features/leads/lead-view/create-lead-meeting/logic/cubit/create_lead_meeting_cubit.dart';
import '../../features/leads/lead-view/create-lead-task/data/repo/create_lead_task_repo.dart';
import '../../features/leads/lead-view/create-lead-task/logic/cubit/create_lead_task_cubit.dart';
import '../../features/leads/lead-view/delete-note/data/repo/delete_note_repo.dart';
import '../../features/leads/lead-view/delete-note/logic/cubit/delete_note_cubit.dart';
import '../../features/leads/lead-view/delete_attachment/data/repo/delete_attachment_repo.dart';
import '../../features/leads/lead-view/delete_attachment/logic/cubit/delete_attachment_cubit.dart';
import '../../features/leads/lead-view/edit-lead/logic/cubit/edit_lead_cubit.dart';
import '../../features/leads/lead-view/create-note/data/repo/create_note_repo.dart';
import '../../features/leads/lead-view/create-note/logic/cubit/create_note_cubit.dart';
import '../../features/leads/lead-view/lead-view/data/repo/leads_view_repo.dart';
import '../../features/leads/lead-view/lead-view/logic/cubit/leads_view_cubit.dart';
import '../../features/leads/lead-view/update-note/logic/cubit/update_note_cubit.dart';
import '../../features/leads/leads/logic/cubit/leads_cubit.dart';
import '../cubits/image_picker_cubit.dart';
import '../cubits/show_fields.cubit.dart';

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

  /// Leads cubit instance
  getIt
      .registerLazySingleton<LeadsCubit>(() => LeadsCubit(getIt<ApiService>()));

  // leads view repo instance
  getIt.registerLazySingleton<LeadsViewRepo>(() => LeadsViewRepo(getIt()));
  getIt.registerLazySingleton<LeadsViewCubit>(
      () => LeadsViewCubit(getIt<LeadsViewRepo>()));

  // show fields cubit instance
  getIt.registerLazySingleton<ShowFieldsCubit>(() => ShowFieldsCubit());

  // create lead instance
  getIt.registerLazySingleton<CreateLeadCubit>(
      () => CreateLeadCubit(getIt<ApiService>()));

  // image picker cubit instance
  getIt.registerLazySingleton<ImagePickerCubit>(() => ImagePickerCubit());

  // Edit lead instance
  getIt.registerLazySingleton<EditLeadRepo>(() => EditLeadRepo(getIt()));
  getIt.registerLazySingleton<EditLeadCubit>(
      () => EditLeadCubit(getIt<EditLeadRepo>()));

  // Create Note instance
  getIt.registerLazySingleton<CreateNoteRepo>(() => CreateNoteRepo(getIt()));
  getIt.registerLazySingleton<CreateNoteCubit>(
      () => CreateNoteCubit(getIt<CreateNoteRepo>()));

  // Update Note instance
  getIt.registerLazySingleton<UpdateNoteCubit>(
      () => UpdateNoteCubit(getIt<ApiService>()));

  // Delete Note instance
  getIt.registerLazySingleton<DeleteNoteRepo>(() => DeleteNoteRepo(getIt()));
  getIt.registerLazySingleton<DeleteNoteCubit>(
      () => DeleteNoteCubit(getIt<DeleteNoteRepo>()));

  // Create Attachment instance
  getIt.registerLazySingleton<CreateAttachmentRepo>(
      () => CreateAttachmentRepo(getIt()));
  getIt.registerLazySingleton<CreateAttachmentCubit>(
      () => CreateAttachmentCubit(getIt<CreateAttachmentRepo>()));

  // Delete Attachment instance
  getIt.registerLazySingleton<DeleteAttachmentRepo>(
      () => DeleteAttachmentRepo(getIt()));
  getIt.registerLazySingleton<DeleteAttachmentCubit>(
      () => DeleteAttachmentCubit(getIt<DeleteAttachmentRepo>()));

  // Create Lead Task instance
  getIt.registerLazySingleton<CreateLeadTaskRepo>(
      () => CreateLeadTaskRepo(getIt()));
  getIt.registerLazySingleton<CreateLeadTaskCubit>(
      () => CreateLeadTaskCubit(getIt<CreateLeadTaskRepo>()));

  // Create Lead Meeting instance
  getIt.registerLazySingleton<CreateLeadMeetingRepo>(
      () => CreateLeadMeetingRepo(getIt()));
  getIt.registerLazySingleton<CreateLeadMeetingCubit>(
      () => CreateLeadMeetingCubit(getIt<CreateLeadMeetingRepo>()));
}
