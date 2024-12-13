import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

/// model class for login response
@JsonSerializable()
class LoginResponse {
  String? status;
  String? token;
  @JsonKey(name: 'user')
  UserData? userData;

  LoginResponse({this.status, this.token, this.userData});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

///  model class for user data
@JsonSerializable()
class UserData {
  int? id;
  String? name;
  String? email;
  String? tenantId;
  String? emailVerifiedAt;
  dynamic departmentId;
  int? companyId;
  String? avatar;
  int? roleAs;
  int? isTenant;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  dynamic department;
  List<dynamic>? roles;
  List<Permissions>? permissions;
  UserData(
      {this.id,
      this.name,
      this.email,
      this.tenantId,
      this.emailVerifiedAt,
      this.departmentId,
      this.companyId,
      this.avatar,
      this.roleAs,
      this.isTenant,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.department,
      this.roles,
      this.permissions});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

/// model class for permissions
@JsonSerializable()
class Permissions {
  String? name;
  Pivot? pivot;

  Permissions({this.name, this.pivot});

  factory Permissions.fromJson(Map<String, dynamic> json) =>
      _$PermissionsFromJson(json);
}

/// model class for pivot
@JsonSerializable()
class Pivot {
  String? modelType;
  int? modelId;
  int? permissionId;

  Pivot({this.modelType, this.modelId, this.permissionId});

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);
}
