import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trick_crm_app/features/auth/login/data/models/login_request_body.dart';
import 'package:trick_crm_app/features/auth/login/data/models/login_response.dart';
import 'package:trick_crm_app/features/leads/create-lead/data/models/create_lead_model.dart';
import 'package:trick_crm_app/features/leads/leads/data/models/leads_model.dart';
import 'package:trick_crm_app/features/leads/lead-view/edit-lead/data/model/edit_lead_model.dart';

import '../../features/clients/clients/data/model/clients_model.dart';
import '../../features/home/data/models/dashboard_response.dart';
import '../../features/leads/create-lead/data/models/create_lead_request_body.dart';
import '../../features/leads/lead-view/create-attachment/data/model/create_attachment_model.dart';
import '../../features/leads/lead-view/create-lead-meeting/data/model/create_lead_meeting_model.dart';
import '../../features/leads/lead-view/create-lead-meeting/data/model/create_lead_meeting_request_body.dart';
import '../../features/leads/lead-view/create-lead-task/data/model/create_lead_task_model.dart';
import '../../features/leads/lead-view/create-lead-task/data/model/create_lead_task_request_body.dart';
import '../../features/leads/lead-view/notes/create-note/data/model/create_lead_note_model.dart';
import '../../features/leads/lead-view/notes/create-note/data/model/create_lead_note_reqest_body.dart';
import '../../features/leads/lead-view/notes/delete-note/data/model/delete_note_model.dart';
import '../../features/leads/lead-view/delete_attachment/data/model/delete_attachment_model.dart';
import '../../features/leads/lead-view/lead-view/data/model/leads_view_model.dart';
import '../../features/leads/lead-view/notes/update-note/data/models/update_lead_note_model.dart';
import '../../features/leads/lead-view/notes/update-note/data/models/update_lead_note_request_body.dart';
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

  /// service for Leads Edit
  @GET("/leads/{id}/edit")
  Future<EditLeadModel> getEditLead(@Path("id") int id);

  /// service for create Lead Note
  @POST("/leads/{id}/create-note")
  Future<CreateLeadNoteModel> createLeadNote(@Path("id") int id,
      @Body() CreateLeadNoteRequestBody createLeadNoteRequestBody);

  /// service for update Lead Note
  @PUT("/leads/{id}/{idNote}/update-note")
  Future<UpdateLeadNoteModel> updateLeadNote(
      @Path("id") int id,
      @Path("idNote") int idNote,
      @Body() UpdateLeadNoteRequestBody updateLeadNoteRequestBody);

  /// service for delete Lead Note
  @GET("/leads/{id}/{idNote}/delete-note")
  Future<DeleteNoteModel> deleteLeadNote(
      @Path("id") int id, @Path("idNote") int idNote);

  /// service for create attachment
  @POST("/leads/{id}/create-attachment")
  Future<CreateAttachmentModel> createAttachment(
    @Path("id") int leadId,
    @Body() File attachment,
  );

  /// service for delete attachment
  @GET("/leads/{id}/{idAttachment}/delete-attachment")
  Future<DeleteAttachmentModel> deleteAttachment(
      @Path("id") int id, @Path("idAttachment") int idAttachment);

  /// service for create lead task
  @POST("/leads/{id}/create-task")
  Future<CreateLeadTaskModel> createLeadTask(
    @Path("id") int leadId,
    @Body() CreateLeadTaskRequestBody createLeadTaskRequestBody,
  );

  /// service for create lead meeting
  @POST("/leads/{id}/create-meeting")
  Future<CreateLeadMeetingModel> createLeadMeeting(
    @Path("id") int leadId,
    @Body() CreateLeadMeetingRequestBody createLeadMeetingRequestBody,
  );

  /// service for Clients
  @GET(ApiConstants.clients)
  Future<ClientsModel> getClients();
}
