// To parse this JSON data, do
//
//     final playerStatisticsResponse = playerStatisticsResponseFromMap(jsonString);

import 'dart:convert';

class PlayerStatisticsResponse {
  PlayerStatisticsResponse({
    required this.playerStatisticsResponseGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  String playerStatisticsResponseGet;
  Parameters parameters;
  List<dynamic> errors;
  int results;
  Paging paging;
  List<Response> response;

  factory PlayerStatisticsResponse.fromJson(String str) => PlayerStatisticsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlayerStatisticsResponse.fromMap(Map<String, dynamic> json) => PlayerStatisticsResponse(
    playerStatisticsResponseGet: json["get"],
    parameters: Parameters.fromMap(json["parameters"]),
    errors: List<dynamic>.from(json["errors"].map((x) => x)),
    results: json["results"],
    paging: Paging.fromMap(json["paging"]),
    response: List<Response>.from(json["response"].map((x) => Response.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "get": playerStatisticsResponseGet,
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
    required this.id,
    required this.season,
  });

  String id;
  String season;

  factory Parameters.fromJson(String str) => Parameters.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Parameters.fromMap(Map<String, dynamic> json) => Parameters(
    id: json["id"],
    season: json["season"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "season": season,
  };
}

class Response {
  Response({
    required this.player,
    required this.statistics,
  });

  Player player;
  List<Statistic> statistics;

  factory Response.fromJson(String str) => Response.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Response.fromMap(Map<String, dynamic> json) => Response(
    player: Player.fromMap(json["player"]),
    statistics: List<Statistic>.from(json["statistics"].map((x) => Statistic.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "player": player.toMap(),
    "statistics": List<dynamic>.from(statistics.map((x) => x.toMap())),
  };
}

class Player {
  Player({
    required this.id,
    required this.name,
    required this.firstname,
    required this.lastname,
    required this.age,
    required this.birth,
    required this.nationality,
    required this.height,
    required this.weight,
    required this.injured,
    required this.photo,
  });

  int id;
  String name;
  String firstname;
  String lastname;
  int age;
  Birth birth;
  String nationality;
  String height;
  String weight;
  bool injured;
  String photo;

  factory Player.fromJson(String str) => Player.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Player.fromMap(Map<String, dynamic> json) => Player(
    id: json["id"],
    name: json["name"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    age: json["age"],
    birth: Birth.fromMap(json["birth"]),
    nationality: json["nationality"],
    height: json["height"],
    weight: json["weight"],
    injured: json["injured"],
    photo: json["photo"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "firstname": firstname,
    "lastname": lastname,
    "age": age,
    "birth": birth.toMap(),
    "nationality": nationality,
    "height": height,
    "weight": weight,
    "injured": injured,
    "photo": photo,
  };
}

class Birth {
  Birth({
    required this.date,
    required this.place,
    required this.country,
  });

  DateTime date;
  String place;
  String country;

  factory Birth.fromJson(String str) => Birth.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Birth.fromMap(Map<String, dynamic> json) => Birth(
    date: DateTime.parse(json["date"]),
    place: json["place"],
    country: json["country"],
  );

  Map<String, dynamic> toMap() => {
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "place": place,
    "country": country,
  };
}

class Statistic {
  Statistic({
    required this.team,
    required this.league,
    required this.games,
    required this.substitutes,
    required this.shots,
    required this.goals,
    required this.passes,
    required this.tackles,
    required this.duels,
    required this.dribbles,
    required this.fouls,
    required this.cards,
    required this.penalty,
  });

  Team team;
  League league;
  Games games;
  Substitutes substitutes;
  Shots shots;
  Goals goals;
  Passes passes;
  Tackles tackles;
  Duels duels;
  Dribbles dribbles;
  Fouls fouls;
  Cards cards;
  Penalty penalty;

  factory Statistic.fromJson(String str) => Statistic.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Statistic.fromMap(Map<String, dynamic> json) => Statistic(
    team: Team.fromMap(json["team"]),
    league: League.fromMap(json["league"]),
    games: Games.fromMap(json["games"]),
    substitutes: Substitutes.fromMap(json["substitutes"]),
    shots: Shots.fromMap(json["shots"]),
    goals: Goals.fromMap(json["goals"]),
    passes: Passes.fromMap(json["passes"]),
    tackles: Tackles.fromMap(json["tackles"]),
    duels: Duels.fromMap(json["duels"]),
    dribbles: Dribbles.fromMap(json["dribbles"]),
    fouls: Fouls.fromMap(json["fouls"]),
    cards: Cards.fromMap(json["cards"]),
    penalty: Penalty.fromMap(json["penalty"]),
  );

  Map<String, dynamic> toMap() => {
    "team": team.toMap(),
    "league": league.toMap(),
    "games": games.toMap(),
    "substitutes": substitutes.toMap(),
    "shots": shots.toMap(),
    "goals": goals.toMap(),
    "passes": passes.toMap(),
    "tackles": tackles.toMap(),
    "duels": duels.toMap(),
    "dribbles": dribbles.toMap(),
    "fouls": fouls.toMap(),
    "cards": cards.toMap(),
    "penalty": penalty.toMap(),
  };
}

class Cards {
  Cards({
    required this.yellow,
    required this.yellowred,
    required this.red,
  });

  int yellow;
  int yellowred;
  int red;

  factory Cards.fromJson(String str) => Cards.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cards.fromMap(Map<String, dynamic> json) => Cards(
    yellow: json["yellow"],
    yellowred: json["yellowred"],
    red: json["red"],
  );

  Map<String, dynamic> toMap() => {
    "yellow": yellow,
    "yellowred": yellowred,
    "red": red,
  };
}

class Dribbles {
  Dribbles({
    this.attempts,
    this.success,
    this.past,
  });

  int? attempts;
  int? success;
  dynamic past;

  factory Dribbles.fromJson(String str) => Dribbles.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dribbles.fromMap(Map<String, dynamic> json) => Dribbles(
    attempts: json["attempts"],
    success: json["success"],
    past: json["past"],
  );

  Map<String, dynamic> toMap() => {
    "attempts": attempts,
    "success": success,
    "past": past,
  };
}

class Duels {
  Duels({
    this.total,
    this.won,
  });

  int? total;
  int? won;

  factory Duels.fromJson(String str) => Duels.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Duels.fromMap(Map<String, dynamic> json) => Duels(
    total: json["total"],
    won: json["won"],
  );

  Map<String, dynamic> toMap() => {
    "total": total,
    "won": won,
  };
}

class Fouls {
  Fouls({
    this.drawn,
    this.committed,
  });

  int? drawn;
  int? committed;

  factory Fouls.fromJson(String str) => Fouls.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Fouls.fromMap(Map<String, dynamic> json) => Fouls(
    drawn: json["drawn"],
    committed: json["committed"],
  );

  Map<String, dynamic> toMap() => {
    "drawn": drawn,
    "committed": committed,
  };
}

class Games {
  Games({
    required this.appearences,
    required this.lineups,
    required this.minutes,
    this.number,
    required this.position,
    this.rating,
    required this.captain,
  });

  int appearences;
  int lineups;
  int minutes;
  dynamic number;
  String position;
  String? rating;
  bool captain;

  factory Games.fromJson(String str) => Games.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Games.fromMap(Map<String, dynamic> json) => Games(
    appearences: json["appearences"],
    lineups: json["lineups"],
    minutes: json["minutes"],
    number: json["number"],
    position: json["position"],
    rating: json["rating"],
    captain: json["captain"],
  );

  Map<String, dynamic> toMap() => {
    "appearences": appearences,
    "lineups": lineups,
    "minutes": minutes,
    "number": number,
    "position": position,
    "rating": rating,
    "captain": captain,
  };
}

class Goals {
  Goals({
    required this.total,
    this.conceded,
    this.assists,
    this.saves,
  });

  int total;
  int? conceded;
  int? assists;
  dynamic saves;

  factory Goals.fromJson(String str) => Goals.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Goals.fromMap(Map<String, dynamic> json) => Goals(
    total: json["total"],
    conceded: json["conceded"],
    assists: json["assists"],
    saves: json["saves"],
  );

  Map<String, dynamic> toMap() => {
    "total": total,
    "conceded": conceded,
    "assists": assists,
    "saves": saves,
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
  });

  int id;
  String name;
  String country;
  String logo;
  String flag;
  int season;

  factory League.fromJson(String str) => League.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory League.fromMap(Map<String, dynamic> json) => League(
    id: json["id"],
    name: json["name"],
    country: json["country"],
    logo: json["logo"],
    flag: json["flag"],
    season: json["season"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "country": country,
    "logo": logo,
    "flag": flag,
    "season": season,
  };
}

class Passes {
  Passes({
    this.total,
    this.key,
    this.accuracy,
  });

  int? total;
  int? key;
  int? accuracy;

  factory Passes.fromJson(String str) => Passes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Passes.fromMap(Map<String, dynamic> json) => Passes(
    total: json["total"],
    key: json["key"],
    accuracy: json["accuracy"],
  );

  Map<String, dynamic> toMap() => {
    "total": total,
    "key": key,
    "accuracy": accuracy,
  };
}

class Penalty {
  Penalty({
    this.won,
    this.commited,
    this.scored,
    this.missed,
    this.saved,
  });

  dynamic won;
  dynamic commited;
  int? scored;
  int? missed;
  dynamic saved;

  factory Penalty.fromJson(String str) => Penalty.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Penalty.fromMap(Map<String, dynamic> json) => Penalty(
    won: json["won"],
    commited: json["commited"],
    scored: json["scored"],
    missed: json["missed"],
    saved: json["saved"],
  );

  Map<String, dynamic> toMap() => {
    "won": won,
    "commited": commited,
    "scored": scored,
    "missed": missed,
    "saved": saved,
  };
}

class Shots {
  Shots({
    this.total,
    this.on,
  });

  int? total;
  int? on;

  factory Shots.fromJson(String str) => Shots.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Shots.fromMap(Map<String, dynamic> json) => Shots(
    total: json["total"],
    on: json["on"],
  );

  Map<String, dynamic> toMap() => {
    "total": total,
    "on": on,
  };
}

class Substitutes {
  Substitutes({
    required this.substitutesIn,
    required this.out,
    required this.bench,
  });

  int substitutesIn;
  int out;
  int bench;

  factory Substitutes.fromJson(String str) => Substitutes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Substitutes.fromMap(Map<String, dynamic> json) => Substitutes(
    substitutesIn: json["in"],
    out: json["out"],
    bench: json["bench"],
  );

  Map<String, dynamic> toMap() => {
    "in": substitutesIn,
    "out": out,
    "bench": bench,
  };
}

class Tackles {
  Tackles({
    this.total,
    this.blocks,
    this.interceptions,
  });

  int? total;
  int? blocks;
  int? interceptions;

  factory Tackles.fromJson(String str) => Tackles.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tackles.fromMap(Map<String, dynamic> json) => Tackles(
    total: json["total"],
    blocks: json["blocks"],
    interceptions: json["interceptions"],
  );

  Map<String, dynamic> toMap() => {
    "total": total,
    "blocks": blocks,
    "interceptions": interceptions,
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
