import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trick_crm_app/features/auth/login/data/models/login_request_body.dart';
import 'package:trick_crm_app/features/auth/login/data/models/login_response.dart';
import 'package:trick_crm_app/features/leads/create-lead/data/models/create_lead_model.dart';
import 'package:trick_crm_app/features/leads/data/models/leads_model.dart';

import '../../features/home/data/models/dashboard_response.dart';
import '../../features/leads/create-lead/data/models/create_lead_request_body.dart';
import '../../features/leads/leads-view/data/model/leads_view_model.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

/// This is the API service class that handles all the API calls.
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  /// service for login
  @POST(ApiConstants.login)
  Future<LoginResponseModel> login(@Body() LoginRequestBody loginRequestBody);

  /// service for dashboard
  @GET(ApiConstants.dashboard)
  Future<DashboardResponseModel> getDashboard();

  /// service for Leads
  @GET(ApiConstants.leads)
  Future<LeadsModel> getLeads();

  /// service for create Lead
  @POST(ApiConstants.createLead)
  Future<CreateLeadModel> createLead(
      @Body() CreateLeadRequestBody createLeadRequestBody);

  /// service for Leads View
  @GET("/leads/{id}/view")
  Future<LeadsViewModel> getLeadsView(@Path("id") int id);
}
