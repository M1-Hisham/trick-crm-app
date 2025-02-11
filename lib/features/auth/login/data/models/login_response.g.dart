// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      status: json['status'] as String?,
      token: json['token'] as String?,
      userData: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'token': instance.token,
      'user': instance.userData,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      tenantId: json['tenant_id'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      departmentId: json['department_id'],
      companyId: (json['company_id'] as num?)?.toInt(),
      avatar: json['avatar'] as String?,
      roleAs: (json['role_as'] as num?)?.toInt(),
      isTenant: (json['is_tenant'] as num?)?.toInt(),
      isActive: (json['is_active'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      department: json['department'],
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => Roles.fromJson(e as Map<String, dynamic>))
          .toList(),
      permissions: (json['permissions'] as List<dynamic>?)
          ?.map((e) => Permissions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'tenant_id': instance.tenantId,
      'email_verified_at': instance.emailVerifiedAt,
      'department_id': instance.departmentId,
      'company_id': instance.companyId,
      'avatar': instance.avatar,
      'role_as': instance.roleAs,
      'is_tenant': instance.isTenant,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'department': instance.department,
      'roles': instance.roles,
      'permissions': instance.permissions,
    };

Roles _$RolesFromJson(Map<String, dynamic> json) => Roles(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      guardName: json['guardName'] as String?,
      tenantId: json['tenantId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      pivot: json['pivot'] == null
          ? null
          : PivotRoles.fromJson(json['pivot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RolesToJson(Roles instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'guardName': instance.guardName,
      'tenantId': instance.tenantId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'pivot': instance.pivot,
    };

PivotRoles _$PivotRolesFromJson(Map<String, dynamic> json) => PivotRoles(
      modelType: json['modelType'] as String?,
      modelId: (json['modelId'] as num?)?.toInt(),
      roleId: (json['roleId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PivotRolesToJson(PivotRoles instance) =>
    <String, dynamic>{
      'modelType': instance.modelType,
      'modelId': instance.modelId,
      'roleId': instance.roleId,
    };

Permissions _$PermissionsFromJson(Map<String, dynamic> json) => Permissions(
      name: json['name'] as String?,
      pivot: json['pivot'] == null
          ? null
          : PivotPermissions.fromJson(json['pivot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PermissionsToJson(Permissions instance) =>
    <String, dynamic>{
      'name': instance.name,
      'pivot': instance.pivot,
    };

PivotPermissions _$PivotPermissionsFromJson(Map<String, dynamic> json) =>
    PivotPermissions(
      modelType: json['model_type'] as String?,
      modelId: (json['model_id'] as num?)?.toInt(),
      permissionId: (json['permission_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PivotPermissionsToJson(PivotPermissions instance) =>
    <String, dynamic>{
      'model_type': instance.modelType,
      'model_id': instance.modelId,
      'permission_id': instance.permissionId,
    };
