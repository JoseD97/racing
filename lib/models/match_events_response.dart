// To parse this JSON data, do
//
//     final matchEventsResponse = matchEventsResponseFromMap(jsonString);

import 'dart:convert';

class MatchEventsResponse {
  MatchEventsResponse({
    required this.matchEventsResponseGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  String matchEventsResponseGet;
  Parameters parameters;
  List<dynamic> errors;
  int results;
  Paging paging;
  List<Response> response;

  factory MatchEventsResponse.fromJson(String str) => MatchEventsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MatchEventsResponse.fromMap(Map<String, dynamic> json) => MatchEventsResponse(
    matchEventsResponseGet: json["get"],
    parameters: Parameters.fromMap(json["parameters"]),
    errors: List<dynamic>.from(json["errors"].map((x) => x)),
    results: json["results"],
    paging: Paging.fromMap(json["paging"]),
    response: List<Response>.from(json["response"].map((x) => Response.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "get": matchEventsResponseGet,
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
    required this.time,
    required this.team,
    required this.player,
    required this.assist,
    required this.type,
    required this.detail,
    this.comments,
  });

  Time time;
  Team team;
  Player player;
  Assist assist;
  String type;
  String detail;
  String? comments;

  factory Response.fromJson(String str) => Response.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Response.fromMap(Map<String, dynamic> json) => Response(
    time: Time.fromMap(json["time"]),
    team: Team.fromMap(json["team"]),
    player: Player.fromMap(json["player"]),
    assist: Assist.fromMap(json["assist"]),
    type: json["type"],
    detail: json["detail"],
    comments: json["comments"],
  );

  Map<String, dynamic> toMap() => {
    "time": time.toMap(),
    "team": team.toMap(),
    "player": player.toMap(),
    "assist": assist.toMap(),
    "type": type,
    "detail": detail,
    "comments": comments,
  };
}

class Assist {
  Assist({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Assist.fromJson(String str) => Assist.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Assist.fromMap(Map<String, dynamic> json) => Assist(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
  };
}

class Player {
  Player({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Player.fromJson(String str) => Player.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Player.fromMap(Map<String, dynamic> json) => Player(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
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

class Time {
  Time({
    required this.elapsed,
    this.extra,
  });

  int elapsed;
  int? extra;

  factory Time.fromJson(String str) => Time.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Time.fromMap(Map<String, dynamic> json) => Time(
    elapsed: json["elapsed"],
    extra: json["extra"],
  );

  Map<String, dynamic> toMap() => {
    "elapsed": elapsed,
    "extra": extra,
  };
}
