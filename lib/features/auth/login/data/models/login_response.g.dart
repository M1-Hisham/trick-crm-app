// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      status: json['status'] as String?,
      token: json['token'] as String?,
      userData: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'token': instance.token,
      'user': instance.userData,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      tenantId: json['tenantId'] as String?,
      emailVerifiedAt: json['emailVerifiedAt'] as String?,
      departmentId: json['departmentId'],
      companyId: (json['companyId'] as num?)?.toInt(),
      avatar: json['avatar'] as String?,
      roleAs: (json['roleAs'] as num?)?.toInt(),
      isTenant: (json['isTenant'] as num?)?.toInt(),
      isActive: (json['isActive'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      department: json['department'],
      roles: json['roles'] as List<dynamic>?,
      permissions: (json['permissions'] as List<dynamic>?)
          ?.map((e) => Permissions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'tenantId': instance.tenantId,
      'emailVerifiedAt': instance.emailVerifiedAt,
      'departmentId': instance.departmentId,
      'companyId': instance.companyId,
      'avatar': instance.avatar,
      'roleAs': instance.roleAs,
      'isTenant': instance.isTenant,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'department': instance.department,
      'roles': instance.roles,
      'permissions': instance.permissions,
    };

Permissions _$PermissionsFromJson(Map<String, dynamic> json) => Permissions(
      name: json['name'] as String?,
      pivot: json['pivot'] == null
          ? null
          : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PermissionsToJson(Permissions instance) =>
    <String, dynamic>{
      'name': instance.name,
      'pivot': instance.pivot,
    };

Pivot _$PivotFromJson(Map<String, dynamic> json) => Pivot(
      modelType: json['modelType'] as String?,
      modelId: (json['modelId'] as num?)?.toInt(),
      permissionId: (json['permissionId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PivotToJson(Pivot instance) => <String, dynamic>{
      'modelType': instance.modelType,
      'modelId': instance.modelId,
      'permissionId': instance.permissionId,
    };
