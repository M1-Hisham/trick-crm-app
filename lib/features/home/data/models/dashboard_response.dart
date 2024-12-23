import 'package:json_annotation/json_annotation.dart';

part 'dashboard_response.g.dart';

@JsonSerializable()
class DashboardResponseModel {
  String? status;
  Data? data;

  DashboardResponseModel({this.status, this.data});
  factory DashboardResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardResponseModelFromJson(json);
}

@JsonSerializable()
class Data {
  List<dynamic>? leads;
  List<dynamic>? clients;
  List<dynamic>? deals;
  List<dynamic>? bigChartDeals;
  List<dynamic>? tasks;
  List<dynamic>? meetings;
  List<dynamic>? calls;
  List<TopFiveSalesPersons>? topFiveSalesPersons;

  Data({
    this.leads,
    this.clients,
    this.deals,
    this.bigChartDeals,
    this.tasks,
    this.meetings,
    this.calls,
    this.topFiveSalesPersons,
  });
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class TopFiveSalesPersons {
  String? name;
  String? year;
  String? gdp;

  TopFiveSalesPersons({this.name, this.year, this.gdp});

  factory TopFiveSalesPersons.fromJson(Map<String, dynamic> json) =>
      _$TopFiveSalesPersonsFromJson(json);
}
