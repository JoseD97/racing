import 'package:flutter/material.dart';

class TeamProvider extends ChangeNotifier{
  /// Match
  // Define de matchType: '0' last, '1' next, '2' all
  int _matchType = 0;
  int get matchType => _matchType;
  set matchType(int value) {
    _matchType = value;
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

  // Selected match date
  String _matchDate = '';
  String get matchDate => _matchDate;
  set matchDate(String value) {
    _matchDate = value;
    notifyListeners();
  }

  // Selected score home
  int _homeScore = 0;
  int get homeScore => _homeScore;
  set homeScore(int value) {
    _homeScore = value;
    notifyListeners();
  }

  // Selected score away
  int _awayScore = 0;
  int get awayScore => _awayScore;
  set awayScore(int value) {
    _awayScore = value;
    notifyListeners();
  }

  /// Player
  // Selected player id
  int _idPlayer = 0;
  int get idPlayer => _idPlayer;
  set idPlayer(int value) {
    _idPlayer = value;
    notifyListeners();
  }



}