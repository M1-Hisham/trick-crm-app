import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

/// model class for login response
@JsonSerializable()
class LoginResponseModel {
  String? status;
  String? token;
  @JsonKey(name: 'user')
  UserData? userData;

  LoginResponseModel({this.status, this.token, this.userData});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}

///  model class for user data
@JsonSerializable()
class UserData {
  int? id;
  String? name;
  String? email;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'email_verified_at')
  String? emailVerifiedAt;
  @JsonKey(name: 'department_id')
  dynamic departmentId;
  @JsonKey(name: 'company_id')
  int? companyId;
  String? avatar;
  @JsonKey(name: 'role_as')
  int? roleAs;
  @JsonKey(name: 'is_tenant')
  int? isTenant;
  @JsonKey(name: 'is_active')
  int? isActive;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  dynamic department;
  List<Roles>? roles;
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

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

/// model class for roles
@JsonSerializable()
class Roles {
  int? id;
  String? name;
  String? guardName;
  String? tenantId;
  String? createdAt;
  String? updatedAt;
  PivotRoles? pivot;

  Roles({
    this.id,
    this.name,
    this.guardName,
    this.tenantId,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Roles.fromJson(Map<String, dynamic> json) => _$RolesFromJson(json);

  Map<String, dynamic> toJson() => _$RolesToJson(this);
}

/// model class for pivot roles
@JsonSerializable()
class PivotRoles {
  String? modelType;
  int? modelId;
  int? roleId;

  PivotRoles({this.modelType, this.modelId, this.roleId});

  factory PivotRoles.fromJson(Map<String, dynamic> json) =>
      _$PivotRolesFromJson(json);

  Map<String, dynamic> toJson() => _$PivotRolesToJson(this);
}

/// model class for permissions
@JsonSerializable()
class Permissions {
  String? name;
  PivotPermissions? pivot;

  Permissions({this.name, this.pivot});

  factory Permissions.fromJson(Map<String, dynamic> json) =>
      _$PermissionsFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionsToJson(this);
}

/// model class for pivot permissions
@JsonSerializable()
class PivotPermissions {
  @JsonKey(name: 'model_type')
  String? modelType;
  @JsonKey(name: 'model_id')
  int? modelId;
  @JsonKey(name: 'permission_id')
  int? permissionId;

  PivotPermissions({this.modelType, this.modelId, this.permissionId});

  factory PivotPermissions.fromJson(Map<String, dynamic> json) =>
      _$PivotPermissionsFromJson(json);

  Map<String, dynamic> toJson() => _$PivotPermissionsToJson(this);
}
