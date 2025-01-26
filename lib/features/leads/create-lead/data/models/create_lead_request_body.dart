import 'package:json_annotation/json_annotation.dart';

part 'create_lead_request_body.g.dart';

@JsonSerializable()
class CreateLeadRequestBody {
  final String? image;
  final String? saluation;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'lead_name')
  final String? leadName;
  final String? company;
  @JsonKey(name: 'job_title')
  final String? jobTitle;
  final String email;
  final String mobile;
  @JsonKey(name: 'mobile_2')
  final String? mobile2;
  final String? website;
  final String? rating;
  @JsonKey(name: 'lead_status')
  final String? leadStatus;
  @JsonKey(name: 'lead_source')
  final String? leadSource;
  @JsonKey(name: 'annual_revenue')
  final int? annualRevenue;
  final String? industry;
  final String? country;
  final String? city;
  final String? state;
  final String? description;
  @JsonKey(name: 'assigned_to_id')
  final int? assignedToId;
  @JsonKey(name: 'end_time')
  final String? endTime;
  @JsonKey(name: 'end_time_hour')
  final String? endTimeHour;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'tenant_id')
  final String? tenantId;
  CreateLeadRequestBody({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    this.image,
    this.saluation,
    this.leadName,
    this.company,
    this.jobTitle,
    this.mobile2,
    this.website,
    this.rating,
    this.leadStatus,
    this.leadSource,
    this.annualRevenue,
    this.industry,
    this.country,
    this.city,
    this.state,
    this.description,
    this.assignedToId,
    this.endTime,
    this.endTimeHour,
    this.userId,
    this.tenantId,
  });

  Map<String, dynamic> toJson() => _$CreateLeadRequestBodyToJson(this);
}
