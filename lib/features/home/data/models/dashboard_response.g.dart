// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardResponseModel _$DashboardResponseModelFromJson(
        Map<String, dynamic> json) =>
    DashboardResponseModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashboardResponseModelToJson(
        DashboardResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      leads: json['leads'] as List<dynamic>?,
      clients: json['clients'] as List<dynamic>?,
      deals: json['deals'] as List<dynamic>?,
      bigChartDeals: json['bigChartDeals'] as List<dynamic>?,
      tasks: json['tasks'] as List<dynamic>?,
      meetings: json['meetings'] as List<dynamic>?,
      calls: json['calls'] as List<dynamic>?,
      topFiveSalesPersons: json['topFiveSalesPersons'] as List<dynamic>?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'leads': instance.leads,
      'clients': instance.clients,
      'deals': instance.deals,
      'bigChartDeals': instance.bigChartDeals,
      'tasks': instance.tasks,
      'meetings': instance.meetings,
      'calls': instance.calls,
      'topFiveSalesPersons': instance.topFiveSalesPersons,
    };
