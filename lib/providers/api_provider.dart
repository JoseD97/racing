import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:racing/models/match_statistics_response.dart';
import 'package:racing/models/matches_response.dart';

import '../models/player_statistics_response.dart';
import '../models/table_response.dart';
import '../models/team_players_response.dart';

class ApiProvider extends ChangeNotifier {
  ApiProvider() {
    print('Api inicializada');
    getLastMatch();
    getNextMatch();
    getTable();
    getTeamPlayers();
  }

  // final _apiKey = '';
  final _apiKey = 'bf881c6a187196902abf5e35189a569c';
  final _apiHost = 'v3.football.api-sports.io';

  // Define de matchType: '0' last, '1' next, '2' all
  int _matchType = 0;
  int get matchType => _matchType;
  set matchType(int value) {
    _matchType = value;
    notifyListeners();
  }

  // Selected player id
  int _idPlayer = 0;
  int get idPlayer => _idPlayer;
  set idPlayer(int value) {
    _idPlayer = value;
    notifyListeners();
  }

  // Selected match id
  int _idMatch = 0;
  int get idMatch => _idMatch;
  set idMatch(int value) {
    _idMatch = value;
    notifyListeners();
  }

  // Selected match name home
  String _nameHomeMatch = '';
  String get nameHomeMatch => _nameHomeMatch;
  set nameHomeMatch(String value) {
    _nameHomeMatch = value;
    notifyListeners();
  }

  // Selected match name away
  String _nameAwayMatch = '';
  String get nameAwayMatch => _nameAwayMatch;
  set nameAwayMatch(String value) {
    _nameAwayMatch = value;
    notifyListeners();
  }

  // Selected match id home
  int _idHomeMatch = 0;
  int get idHomeMatch => _idHomeMatch;
  set idHomeMatch(int value) {
    _idHomeMatch = value;
    notifyListeners();
  }

  // Selected match id away
  int _idAwayMatch = 0;
  int get idAwayMatch => _idAwayMatch;
  set idAwayMatch(int value) {
    _idAwayMatch = value;
    notifyListeners();
  }

  /// Matches
  // Last match info
  int lastMatchId = 0;
  int lastTeamIdHome = 1;
  int lastTeamIdAway = 1;
  String lastTeamNameHome = 'Racing Santander';
  String lastTeamNameAway = 'Racing Santander';
  int lastScoreHome = 0;
  int lastScoreAway = 0;
  String lastMatchDay = '01/01';
  String lastMatchHour = '00:00';

  // Last match statistics
  int homeShots = 0;
  int homeShotsOnGoal = 0;
  String homeBallPosesession = '0%';
  int homeYellowCards = 0;
  int homeRedCards = 0;
  int homeTotalPasses = 0;

  int awayShots = 0;
  int awayShotsOnGoal = 0;
  String awayBallPosesession = '0%';
  int awayYellowCards = 0;
  int awayRedCards = 0;
  int awayTotalPasses = 0;

  getLastMatch() async {
    final apiUrl = Uri.parse(
        'https://v3.football.api-sports.io/fixtures?season=2022&league=141&team=4665&last=1');
    final response = await http.get(apiUrl, headers: {
      'x-rapidapi-key': _apiKey,
      'x-rapidapi-host': _apiHost,
    });

    if (response.statusCode == 200) {
      final decodedResponse = MatchesResponse.fromJson(response.body);
      lastMatchId = decodedResponse.response[0].fixture.id;
      lastTeamIdHome = decodedResponse.response[0].teams.home.id;
      lastTeamIdAway = decodedResponse.response[0].teams.away.id;
      lastTeamNameHome = decodedResponse.response[0].teams.home.name;
      lastTeamNameAway = decodedResponse.response[0].teams.away.name;
      lastScoreHome = decodedResponse.response[0].goals.home as int;
      lastScoreAway = decodedResponse.response[0].goals.away as int;
      String date = decodedResponse.response[0].fixture.date;
      var month = date.substring(5, 7);
      var day = date.substring(8, 10);
      lastMatchDay = '$day/$month';
      lastMatchHour = date.substring(11, 16);
      //getLastMatchStatistics();
      notifyListeners();
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<bool> getMatchStatistics() async {
    final apiUrl = Uri.parse(
        'https://v3.football.api-sports.io/fixtures/statistics?fixture=$_idMatch');
    final response = await http.get(apiUrl, headers: {
      'x-rapidapi-key': _apiKey,
      'x-rapidapi-host': _apiHost,
    });

    if (response.statusCode == 200) {
      final decodedResponse = MatchStatisticsResponse.fromJson(response.body);
      homeShots = decodedResponse.response[0].statistics[2].value;
      homeShotsOnGoal = decodedResponse.response[0].statistics[0].value;
      homeBallPosesession = decodedResponse.response[0].statistics[9].value;
      homeYellowCards = decodedResponse.response[0].statistics[10].value;
      homeRedCards = decodedResponse.response[0].statistics[11].value;
      homeTotalPasses = decodedResponse.response[0].statistics[13].value;

      awayShots = decodedResponse.response[1].statistics[2].value;
      awayShotsOnGoal = decodedResponse.response[1].statistics[0].value;
      awayBallPosesession = decodedResponse.response[1].statistics[9].value;
      awayYellowCards = decodedResponse.response[1].statistics[10].value;
      awayRedCards = decodedResponse.response[1].statistics[11].value ?? 0;
      awayTotalPasses = decodedResponse.response[1].statistics[13].value;
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }


  // Get the next match
  int nextMatchId = 0;
  int nextTeamIdHome = 1;
  int nextTeamIdAway = 1;
  String nextTeamNameHome = 'Racing Santander';
  String nextTeamNameAway = 'Racing Santander';
  String nextMatchDay = '01/01';
  String nextMatchHour = '00:00';

  getNextMatch() async {
    final apiUrl = Uri.parse(
        'https://v3.football.api-sports.io/fixtures?season=2022&league=141&team=4665&next=1');
    final response = await http.get(apiUrl, headers: {
      'x-rapidapi-key': _apiKey,
      'x-rapidapi-host': _apiHost,
    });

    if (response.statusCode == 200) {
      final decodedResponse = MatchesResponse.fromJson(response.body);
      nextMatchId = decodedResponse.response[0].fixture.id;
      nextTeamIdHome = decodedResponse.response[0].teams.home.id;
      nextTeamIdAway = decodedResponse.response[0].teams.away.id;
      nextTeamNameHome = decodedResponse.response[0].teams.home.name;
      nextTeamNameAway = decodedResponse.response[0].teams.away.name;
      String date = decodedResponse.response[0].fixture.date;
      var month = date.substring(5, 7);
      var day = date.substring(8, 10);
      nextMatchDay = '$day/$month';
      nextMatchHour = date.substring(11, 16);
      notifyListeners();
    } else {
      print(response.reasonPhrase);
    }
  }


  // Get one match

  // All matches
  int totMatches = 0;
  var teamIdMatch = [];
  var teamIdHome = [];
  var teamIdAway = [];
  var teamScoreHome = [];
  var teamScoreAway = [];
  var matchDay = [];

  Future<bool> getAllMatches() async {
    final apiUrl = Uri.parse(
        'https://v3.football.api-sports.io/fixtures?season=2022&league=141&team=4665');
    final response = await http.get(apiUrl, headers: {
      'x-rapidapi-key': _apiKey,
      'x-rapidapi-host': _apiHost,
    });

    if (response.statusCode == 200) {
      final decodedResponse = MatchesResponse.fromJson(response.body);
      totMatches = decodedResponse.results ;
      for(int i = 0; i < totMatches; i++){
        teamIdMatch.add(decodedResponse.response[i].fixture.id);
        teamIdHome.add(decodedResponse.response[i].teams.home.id);
        teamIdAway.add(decodedResponse.response[i].teams.away.id);
        teamScoreHome.add(decodedResponse.response[i].goals.home ?? '');
        teamScoreAway.add(decodedResponse.response[i].goals.away ?? '');
        String date = decodedResponse.response[i].fixture.date;
        var year = date.substring(2, 4);
        var month = date.substring(5, 7);
        var day = date.substring(8, 10);
        matchDay.add('$day/$month/$year');
      }
      notifyListeners();
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }


  /// Get table
  var rank = [];
  var teamLogo = [];
  var teamName = [];
  var matchesPlayed = [];
  var points = [];
  var goalsDiff = [];


  getTable() async {
    final apiUrl = Uri.parse(
        'https://v3.football.api-sports.io/standings?league=141&season=2022');
    final response = await http.get(apiUrl, headers: {
      'x-rapidapi-key': _apiKey,
      'x-rapidapi-host': _apiHost,
    });

    if (response.statusCode == 200) {
      final decodedResponse = TableResponse.fromJson(response.body);
      int totTeams = decodedResponse.response[0].league.standings[0].length;
      for (var i = 0; i < totTeams; i++) {
        rank.add(decodedResponse.response[0].league.standings[0][i].rank);
        teamLogo.add(decodedResponse.response[0].league.standings[0][i].team.logo);
        teamName.add(decodedResponse.response[0].league.standings[0][i].team.name);
        matchesPlayed.add(decodedResponse.response[0].league.standings[0][i].all);
        points.add(decodedResponse.response[0].league.standings[0][i].points);
        goalsDiff.add(decodedResponse.response[0].league.standings[0][i].goalsDiff);
      }
      notifyListeners();
    } else {
      print(response.reasonPhrase);
    }
  }


  /// Team Players
  int totPlayers = 0;
  var playersId = [];
  var playersName = [];
  var playersNumber = [];
  var playersPhoto = [];

  getTeamPlayers() async{
    final apiUrl = Uri.parse('https://v3.football.api-sports.io/players/squads?team=4665');
    final response = await http.get(apiUrl, headers: {
      'x-rapidapi-key': _apiKey,
      'x-rapidapi-host': _apiHost,
    });

    if (response.statusCode == 200) {
      final decodedResponse = TeamPlayersResponse.fromJson(response.body);
      totPlayers = decodedResponse.response[0].players.length;
      for(int i = 0; i < totPlayers; i++){
        playersId.add(decodedResponse.response[0].players[i].id);
        playersName.add(decodedResponse.response[0].players[i].name);
        playersNumber.add(decodedResponse.response[0].players[i].number);
        playersPhoto.add(decodedResponse.response[0].players[i].photo);
      }
      notifyListeners();
    } else {
      print(response.reasonPhrase);
    }
  }

  String playerPosition = '';
  String playerPhoto = '';
  String playerName = '';
  String playerRating = '';
  int playerGames = 0;
  int playerYellowCards = 0;
  int playerRedCards = 0;
  int playerPasses = 0;
  int playerGoals = 0;


  Future<bool> getPlayerStatistics(int id) async{ // TODO Probar con el future y con el return para el snapshot has data y meter los valores en el return
    final apiUrl = Uri.parse('https://v3.football.api-sports.io/players?id=$id&season=2022');
    final response = await http.get(apiUrl, headers: {
      'x-rapidapi-key': _apiKey,
      'x-rapidapi-host': _apiHost,
    });

    if (response.statusCode == 200) {
      final decodedResponse = PlayerStatisticsResponse.fromJson(response.body);
      playerName = decodedResponse.response[0].player.name;
      playerPosition = decodedResponse.response[0].statistics[0].games.position;
      playerPhoto = decodedResponse.response[0].player.photo;
      playerRating = decodedResponse.response[0].statistics[0].games.rating ?? '-';
      playerGames = decodedResponse.response[0].statistics[0].games.appearences;
      playerYellowCards = decodedResponse.response[0].statistics[0].cards.yellow;
      playerRedCards = decodedResponse.response[0].statistics[0].cards.red;
      playerPasses = decodedResponse.response[0].statistics[0].passes.total ?? 0;
      playerGoals = decodedResponse.response[0].statistics[0].goals.total;

      // notifyListeners();
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }

  }
}