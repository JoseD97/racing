import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../widgets/widgets.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    final teamProvider = Provider.of<TeamProvider>(context);
    final width = MediaQuery.of(context).size.width;

    int matchId = teamProvider.idMatch;
    String day = teamProvider.matchDate;
    int homeTeam = teamProvider.idHomeMatch;
    int awayTeam = teamProvider.idAwayMatch;
    String homeName = teamProvider.nameHomeMatch;
    String awayName = teamProvider.nameAwayMatch;
    int homeScore = teamProvider.homeScore;
    int awayScore = teamProvider.awayScore;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background
            const BackgroundContainer(height: 350),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Score
                Container(
                  // margin: EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('LaLiga 2 el $day', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                      const SizedBox(height: 10,),
                      _HomeTeam(homeTeam: homeTeam, homeName: homeName, homeScore: homeScore),
                      const SizedBox(height: 10,),
                      _AwayTeam(awayTeam: awayTeam, awayName: awayName, awayScore: awayScore,)
                    ],
                  ),
                ),

                // Events
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 100,
                  width: width,
                  child: FutureBuilder(
                    future: apiProvider.getMatchEvents(matchId),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      if( matchId <= apiProvider.lastMatchId){ //Only show goals if the match has been played
                        if(snapshot.hasData){
                          var goals = snapshot.data;
                          return ListView.builder(
                              itemCount: goals.length,
                              itemBuilder: (context, i) {
                                return Container(
                                  margin: const EdgeInsets.only(left: 20, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const FaIcon(FontAwesomeIcons.futbol, color: Colors.white),
                                      const SizedBox(width: 10),
                                      Text(goals[i], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                );
                              }
                          );
                        }
                        else if(snapshot.hasError){
                          return const Center(child: Text('Ha habido un error'));
                        }
                        else {
                          return const Center(child: CircularProgressIndicator());
                        }
                      }
                      else {
                        return Container(
                          margin: const EdgeInsets.only(left: 20, bottom: 10),
                          child: const Center(child: Text('Por jugar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        );
                      }
                    }
                  ),
                ),

                const SizedBox(height: 60),

                // Statistics
                FutureBuilder(
                  future: apiProvider.getMatchStatistics(matchId),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if( matchId <= apiProvider.lastMatchId){ //Only show statistics if the match has been played
                      if(snapshot.hasData){
                        var statistics = snapshot.data;
                        return Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    MatchStatisticsContainer(title: 'Tiros', valueHome: statistics[0].toString(), valueAway: statistics[6].toString()),
                                    MatchStatisticsContainer(title: 'Tiros a puerta', valueHome: statistics[1].toString(), valueAway: statistics[7].toString())
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    MatchStatisticsContainer(title: 'Posesión', valueHome: statistics[2].toString(), valueAway: statistics[8].toString()),
                                    MatchStatisticsContainer(title: 'Pases', valueHome: statistics[3].toString(), valueAway: statistics[9].toString())
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    MatchStatisticsContainer(title: 'Tarjetas amarillas', valueHome: statistics[4].toString(), valueAway: statistics[10].toString()),
                                    MatchStatisticsContainer(title: 'Tarjetas rojas', valueHome: statistics[5].toString(), valueAway: statistics[11].toString())
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        );
                      }
                      else if(snapshot.hasError){
                        return const Center(child: Text('Ha habido un error'));
                      }
                      else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }
                    else return const SizedBox();


                  },
                )
              ],
            ),
          ],
        ),
      )
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
    );
  }
}


/// Home team info
class _HomeTeam extends StatelessWidget {

  final int homeTeam;
  final String homeName;
  final int homeScore;

  const _HomeTeam({
    Key? key,
    required this.homeTeam,
    required this.homeName,
    required this.homeScore,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TeamsShield(
                teamId: homeTeam.toString(),
                width: 60,
                height: 60
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 200,
              child: Text(homeName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white), overflow: TextOverflow.ellipsis)
            ),
            const SizedBox(width: 20),
            Text(homeScore.toString(), style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
          ],
        ),
      ),
    );
  }
}

/// Away team info
class _AwayTeam extends StatelessWidget {

  final int awayTeam;
  final String awayName;
  final int awayScore;

  const _AwayTeam({
    Key? key,
    required this.awayTeam,
    required this.awayName,
    required this.awayScore,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TeamsShield(
                teamId: awayTeam.toString(),
                width: 60,
                height: 60
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 200,
              child: Text(awayName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white), overflow: TextOverflow.ellipsis)
            ),
            const SizedBox(width: 20),
            Text(awayScore.toString(), style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

