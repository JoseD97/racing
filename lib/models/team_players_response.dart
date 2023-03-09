// To parse this JSON data, do
//
//     final teamPlayersResponse = teamPlayersResponseFromMap(jsonString);

import 'dart:convert';

class TeamPlayersResponse {
  TeamPlayersResponse({
    required this.teamPlayersResponseGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  String teamPlayersResponseGet;
  Parameters parameters;
  List<dynamic> errors;
  int results;
  Paging paging;
  List<Response> response;

  factory TeamPlayersResponse.fromJson(String str) => TeamPlayersResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TeamPlayersResponse.fromMap(Map<String, dynamic> json) => TeamPlayersResponse(
    teamPlayersResponseGet: json["get"],
    parameters: Parameters.fromMap(json["parameters"]),
    errors: List<dynamic>.from(json["errors"].map((x) => x)),
    results: json["results"],
    paging: Paging.fromMap(json["paging"]),
    response: List<Response>.from(json["response"].map((x) => Response.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "get": teamPlayersResponseGet,
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
    required this.team,
  });

  String team;

  factory Parameters.fromJson(String str) => Parameters.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Parameters.fromMap(Map<String, dynamic> json) => Parameters(
    team: json["team"],
  );

  Map<String, dynamic> toMap() => {
    "team": team,
  };
}

class Response {
  Response({
    required this.team,
    required this.players,
  });

  Team team;
  List<Player> players;

  factory Response.fromJson(String str) => Response.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Response.fromMap(Map<String, dynamic> json) => Response(
    team: Team.fromMap(json["team"]),
    players: List<Player>.from(json["players"].map((x) => Player.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "team": team.toMap(),
    "players": List<dynamic>.from(players.map((x) => x.toMap())),
  };
}

class Player {
  Player({
    required this.id,
    required this.name,
    required this.age,
    required this.number,
    required this.position,
    required this.photo,
  });

  int id;
  String name;
  int age;
  int number;
  String position;
  String photo;

  factory Player.fromJson(String str) => Player.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Player.fromMap(Map<String, dynamic> json) => Player(
    id: json["id"],
    name: json["name"],
    age: json["age"],
    number: json["number"],
    position: json["position"],
    photo: json["photo"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "age": age,
    "number": number,
    "position": position,
    "photo": photo,
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
