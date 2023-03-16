import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:racing/models/match_statistics_response.dart';
import 'package:racing/models/matches_response.dart';

import '../models/match_events_response.dart';
import '../models/player_statistics_response.dart';
import '../models/table_response.dart';
import '../models/team_players_response.dart';

class ApiProvider extends ChangeNotifier {
  ApiProvider() {
    getLastMatch();
    getNextMatch();
    getTable();
    getTeamPlayers();
  }

  final _apiKey = 'bf881c6a187196902abf5e35189a569c';
  final _apiHost = 'v3.football.api-sports.io';

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
      notifyListeners();
    } else {
      print(response.reasonPhrase);
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


  // All matches    // TODO Convertir snapshot
  int totMatches = 0;
  var teamIdMatch = [];
  var teamIdHome = [];
  var teamIdAway = [];
  var teamNameHome = [];
  var teamNameAway = [];
  var teamScoreHome = [];
  var teamScoreAway = [];
  var matchDay = [];

  Future<List<List<dynamic>>> getAllMatches() async {
    List<List<dynamic>> data = [];
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
        teamNameHome.add(decodedResponse.response[i].teams.home.name);
        teamNameAway.add(decodedResponse.response[i].teams.away.name);
        teamScoreHome.add(decodedResponse.response[i].goals.home ?? 0);
        teamScoreAway.add(decodedResponse.response[i].goals.away ?? 0);
        String date = decodedResponse.response[i].fixture.date;
        var year = date.substring(2, 4);
        var month = date.substring(5, 7);
        var day = date.substring(8, 10);
        matchDay.add('$day/$month/$year');
      }

      data = [teamIdMatch, teamIdHome, teamIdAway, teamNameHome, teamNameAway, teamScoreHome, teamScoreAway, matchDay];
      return data;
    } else {
      print(response.reasonPhrase);
      return data;
    }
  }

  // Statistics
  Future<List<dynamic>> getMatchStatistics(int matchId) async {
    var data = [];
    final apiUrl = Uri.parse('https://v3.football.api-sports.io/fixtures/statistics?fixture=$matchId');
    final response = await http.get(apiUrl, headers: {
      'x-rapidapi-key': _apiKey,
      'x-rapidapi-host': _apiHost,
    });

    if (response.statusCode == 200) {
      final decodedResponse = MatchStatisticsResponse.fromJson(response.body);
      data.add(decodedResponse.response[0].statistics[2].value ?? 0);
      data.add(decodedResponse.response[0].statistics[0].value ?? 0);
      data.add(decodedResponse.response[0].statistics[9].value ?? '0%');
      data.add(decodedResponse.response[0].statistics[13].value ?? 0);
      data.add(decodedResponse.response[0].statistics[10].value ?? 0);
      data.add(decodedResponse.response[0].statistics[11].value ?? 0);

      data.add(decodedResponse.response[1].statistics[2].value ?? 0);
      data.add(decodedResponse.response[1].statistics[0].value ?? 0);
      data.add(decodedResponse.response[1].statistics[9].value ?? '0%');
      data.add(decodedResponse.response[1].statistics[13].value ?? 0);
      data.add(decodedResponse.response[1].statistics[10].value ?? 0);
      data.add(decodedResponse.response[1].statistics[11].value ?? 0 ?? 0);
      return data;
    } else {
      print(response.reasonPhrase);
      return data;
    }
  }


  // Match events
  Future<List<String>> getMatchEvents(int matchId) async {
    List<String> data = [];
    int totEvents = 0;

    final apiUrl = Uri.parse(
        'https://v3.football.api-sports.io/fixtures/events?fixture=$matchId');
    final response = await http.get(apiUrl, headers: {
      'x-rapidapi-key': _apiKey,
      'x-rapidapi-host': _apiHost,
    });
    if (response.statusCode == 200) {
      final decodedResponse = MatchEventsResponse.fromJson(response.body);
      totEvents = decodedResponse.results;
      for(int i = 0; i < totEvents; i++){
        if( decodedResponse.response[i].type == 'Goal' ){
          data.add(decodedResponse.response[i].player.name);
        }
      }
      return data;
    } else {
      print(response.reasonPhrase);
      return data;
    }
  }

  /// Get table
  var rankTeamId = [];
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
        rankTeamId.add(decodedResponse.response[0].league.standings[0][i].team.id);
        teamName.add(decodedResponse.response[0].league.standings[0][i].team.name);
        matchesPlayed.add(decodedResponse.response[0].league.standings[0][i].all.played);
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

  // Player statistics
  Future<List<dynamic>> getPlayerStatistics(int id) async{
    var data = [];
    final apiUrl = Uri.parse('https://v3.football.api-sports.io/players?id=$id&season=2022');
    final response = await http.get(apiUrl, headers: {
      'x-rapidapi-key': _apiKey,
      'x-rapidapi-host': _apiHost,
    });

    if (response.statusCode == 200) {
      final decodedResponse = PlayerStatisticsResponse.fromJson(response.body);
      data.add(decodedResponse.response[0].player.name);
      data.add(decodedResponse.response[0].statistics[0].games.position);
      data.add(decodedResponse.response[0].player.photo);
      data.add(decodedResponse.response[0].statistics[0].games.rating ?? '-');
      data.add(decodedResponse.response[0].statistics[0].games.appearences);
      data.add(decodedResponse.response[0].statistics[0].cards.yellow);
      data.add(decodedResponse.response[0].statistics[0].cards.red);
      data.add(decodedResponse.response[0].statistics[0].passes.total ?? 0);
      data.add(decodedResponse.response[0].statistics[0].goals.total);
      return data;
    } else {
      print(response.reasonPhrase);
      return data;
    }

  }
}