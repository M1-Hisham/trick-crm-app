import 'package:json_annotation/json_annotation.dart';

part 'create_lead_request_body.g.dart';

@JsonSerializable()
class CreateLeadRequestBody {
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String email;
  final String mobile;
  CreateLeadRequestBody({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
  });

  Map<String, dynamic> toJson() => _$CreateLeadRequestBodyToJson(this);
}
