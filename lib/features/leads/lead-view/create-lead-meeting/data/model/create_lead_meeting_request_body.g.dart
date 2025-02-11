// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_lead_meeting_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateLeadMeetingRequestBody _$CreateLeadMeetingRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreateLeadMeetingRequestBody(
      title: json['title'] as String?,
      hostId: json['hostId'] as String?,
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$CreateLeadMeetingRequestBodyToJson(
        CreateLeadMeetingRequestBody instance) =>
    <String, dynamic>{
      'title': instance.title,
      'hostId': instance.hostId,
      'participants': instance.participants,
      'description': instance.description,
      'location': instance.location,
    };
