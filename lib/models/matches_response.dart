// To parse this JSON data, do
//
//     final matchesResponse = matchesResponseFromMap(jsonString);

import 'dart:convert';

class MatchesResponse {
  MatchesResponse({
    required this.matchesResponseGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  String matchesResponseGet;
  Parameters parameters;
  List<dynamic> errors;
  int results;
  Paging paging;
  List<Response> response;

  factory MatchesResponse.fromJson(String str) => MatchesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MatchesResponse.fromMap(Map<String, dynamic> json) => MatchesResponse(
    matchesResponseGet: json["get"],
    parameters: Parameters.fromMap(json["parameters"]),
    errors: List<dynamic>.from(json["errors"].map((x) => x)),
    results: json["results"],
    paging: Paging.fromMap(json["paging"]),
    response: List<Response>.from(json["response"].map((x) => Response.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "get": matchesResponseGet,
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
    required this.season,
    required this.league,
  });

  String season;
  String league;

  factory Parameters.fromJson(String str) => Parameters.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Parameters.fromMap(Map<String, dynamic> json) => Parameters(
    season: json["season"],
    league: json["league"],
  );

  Map<String, dynamic> toMap() => {
    "season": season,
    "league": league,
  };
}

class Response {
  Response({
    required this.fixture,
    required this.league,
    required this.teams,
    required this.goals,
    required this.score,
  });

  Fixture fixture;
  League league;
  Teams teams;
  Goals goals;
  Score score;

  factory Response.fromJson(String str) => Response.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Response.fromMap(Map<String, dynamic> json) => Response(
    fixture: Fixture.fromMap(json["fixture"]),
    league: League.fromMap(json["league"]),
    teams: Teams.fromMap(json["teams"]),
    goals: Goals.fromMap(json["goals"]),
    score: Score.fromMap(json["score"]),
  );

  Map<String, dynamic> toMap() => {
    "fixture": fixture.toMap(),
    "league": league.toMap(),
    "teams": teams.toMap(),
    "goals": goals.toMap(),
    "score": score.toMap(),
  };
}

class Fixture {
  Fixture({
    required this.id,
    this.referee,
    required this.timezone,
    required this.date,
    required this.timestamp,
    required this.periods,
    required this.venue,
    required this.status,
  });

  int id;
  String? referee;
  String timezone;
  String date;
  int timestamp;
  Periods periods;
  Venue venue;
  Status status;

  factory Fixture.fromJson(String str) => Fixture.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Fixture.fromMap(Map<String, dynamic> json) => Fixture(
    id: json["id"],
    referee: json["referee"],
    timezone: json["timezone"],
    date: json["date"],
    timestamp: json["timestamp"],
    periods: Periods.fromMap(json["periods"]),
    venue: Venue.fromMap(json["venue"]),
    status: Status.fromMap(json["status"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "referee": referee,
    "timezone": timezone,
    "date": date,
    "timestamp": timestamp,
    "periods": periods.toMap(),
    "venue": venue.toMap(),
    "status": status.toMap(),
  };
}

class Periods {
  Periods({
    this.first,
    this.second,
  });

  int? first;
  int? second;

  factory Periods.fromJson(String str) => Periods.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Periods.fromMap(Map<String, dynamic> json) => Periods(
    first: json["first"],
    second: json["second"],
  );

  Map<String, dynamic> toMap() => {
    "first": first,
    "second": second,
  };
}

class Status {
  Status({
    required this.long,
    required this.short,
    this.elapsed,
  });

  String long;
  String short;
  int? elapsed;

  factory Status.fromJson(String str) => Status.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Status.fromMap(Map<String, dynamic> json) => Status(
    long: json["long"],
    short: json["short"],
    elapsed: json["elapsed"],
  );

  Map<String, dynamic> toMap() => {
    "long": long,
    "short": short,
    "elapsed": elapsed,
  };
}

class Venue {
  Venue({
    required this.id,
    required this.name,
    required this.city,
  });

  int id;
  String name;
  String city;

  factory Venue.fromJson(String str) => Venue.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Venue.fromMap(Map<String, dynamic> json) => Venue(
    id: json["id"],
    name: json["name"],
    city: json["city"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "city": city,
  };
}

class Goals {
  Goals({
    this.home,
    this.away,
  });

  int? home;
  int? away;

  factory Goals.fromJson(String str) => Goals.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Goals.fromMap(Map<String, dynamic> json) => Goals(
    home: json["home"],
    away: json["away"],
  );

  Map<String, dynamic> toMap() => {
    "home": home,
    "away": away,
  };
}

class League {
  League({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.flag,
    required this.season,
    required this.round,
  });

  int id;
  String name;
  String country;
  String logo;
  String flag;
  int season;
  String round;

  factory League.fromJson(String str) => League.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory League.fromMap(Map<String, dynamic> json) => League(
    id: json["id"],
    name: json["name"],
    country: json["country"],
    logo: json["logo"],
    flag: json["flag"],
    season: json["season"],
    round: json["round"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "country": country,
    "logo": logo,
    "flag": flag,
    "season": season,
    "round": round,
  };
}

class Score {
  Score({
    required this.halftime,
    required this.fulltime,
    required this.extratime,
    required this.penalty,
  });

  Goals halftime;
  Goals fulltime;
  Extratime extratime;
  Extratime penalty;

  factory Score.fromJson(String str) => Score.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Score.fromMap(Map<String, dynamic> json) => Score(
    halftime: Goals.fromMap(json["halftime"]),
    fulltime: Goals.fromMap(json["fulltime"]),
    extratime: Extratime.fromMap(json["extratime"]),
    penalty: Extratime.fromMap(json["penalty"]),
  );

  Map<String, dynamic> toMap() => {
    "halftime": halftime.toMap(),
    "fulltime": fulltime.toMap(),
    "extratime": extratime.toMap(),
    "penalty": penalty.toMap(),
  };
}

class Extratime {
  Extratime({
    this.home,
    this.away,
  });

  dynamic home;
  dynamic away;

  factory Extratime.fromJson(String str) => Extratime.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Extratime.fromMap(Map<String, dynamic> json) => Extratime(
    home: json["home"],
    away: json["away"],
  );

  Map<String, dynamic> toMap() => {
    "home": home,
    "away": away,
  };
}

class Teams {
  Teams({
    required this.home,
    required this.away,
  });

  Away home;
  Away away;

  factory Teams.fromJson(String str) => Teams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Teams.fromMap(Map<String, dynamic> json) => Teams(
    home: Away.fromMap(json["home"]),
    away: Away.fromMap(json["away"]),
  );

  Map<String, dynamic> toMap() => {
    "home": home.toMap(),
    "away": away.toMap(),
  };
}

class Away {
  Away({
    required this.id,
    required this.name,
    required this.logo,
    this.winner,
  });

  int id;
  String name;
  String logo;
  bool? winner;

  factory Away.fromJson(String str) => Away.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Away.fromMap(Map<String, dynamic> json) => Away(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
    winner: json["winner"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "logo": logo,
    "winner": winner,
  };
}
