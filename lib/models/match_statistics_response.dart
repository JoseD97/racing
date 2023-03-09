// To parse this JSON data, do
//
//     final matchStatisticsResponse = matchStatisticsResponseFromMap(jsonString);

import 'dart:convert';

class MatchStatisticsResponse {
  MatchStatisticsResponse({
    required this.matchStatisticsResponseGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  String matchStatisticsResponseGet;
  Parameters parameters;
  List<dynamic> errors;
  int results;
  Paging paging;
  List<Response> response;

  factory MatchStatisticsResponse.fromJson(String str) => MatchStatisticsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MatchStatisticsResponse.fromMap(Map<String, dynamic> json) => MatchStatisticsResponse(
    matchStatisticsResponseGet: json["get"],
    parameters: Parameters.fromMap(json["parameters"]),
    errors: List<dynamic>.from(json["errors"].map((x) => x)),
    results: json["results"],
    paging: Paging.fromMap(json["paging"]),
    response: List<Response>.from(json["response"].map((x) => Response.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "get": matchStatisticsResponseGet,
    "parameters": parameters.toMap(),
    "errors": List<dynamic>.from(errors.map((x) => x)),
    "results": results,
    "paging": paging.toMap(),
    "response": List<dynamic>.from(response.map((x) => x.toMap())),
  };
}

class Paging {
  Paging({
    required this.current,
    required this.total,
  });

  int current;
  int total;

  factory Paging.fromJson(String str) => Paging.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Paging.fromMap(Map<String, dynamic> json) => Paging(
    current: json["current"],
    total: json["total"],
  );

  Map<String, dynamic> toMap() => {
    "current": current,
    "total": total,
  };
}

class Parameters {
  Parameters({
    required this.fixture,
  });

  String fixture;

  factory Parameters.fromJson(String str) => Parameters.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Parameters.fromMap(Map<String, dynamic> json) => Parameters(
    fixture: json["fixture"],
  );

  Map<String, dynamic> toMap() => {
    "fixture": fixture,
  };
}

class Response {
  Response({
    required this.team,
    required this.statistics,
  });

  Team team;
  List<Statistic> statistics;

  factory Response.fromJson(String str) => Response.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Response.fromMap(Map<String, dynamic> json) => Response(
    team: Team.fromMap(json["team"]),
    statistics: List<Statistic>.from(json["statistics"].map((x) => Statistic.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "team": team.toMap(),
    "statistics": List<dynamic>.from(statistics.map((x) => x.toMap())),
  };
}

class Statistic {
  Statistic({
    required this.type,
    this.value,
  });

  String type;
  dynamic value;

  factory Statistic.fromJson(String str) => Statistic.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Statistic.fromMap(Map<String, dynamic> json) => Statistic(
    type: json["type"],
    value: json["value"],
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "value": value,
  };
}

class Team {
  Team({
    required this.id,
    required this.name,
    required this.logo,
  });

  int id;
  String name;
  String logo;

  factory Team.fromJson(String str) => Team.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Team.fromMap(Map<String, dynamic> json) => Team(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "logo": logo,
  };
}
