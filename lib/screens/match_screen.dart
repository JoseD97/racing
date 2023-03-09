import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../widgets/widgets.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final apiProvider = Provider.of<ApiProvider>(context);
    final width = MediaQuery.of(context).size.width;

    String day = '';
    String hour = '';
    int homeTeam = 1;
    int awayTeam = 1;
    String homeName = '';
    String awayName = '';
    int homeScore = 0;
    int awayScore = 0;
    int id = 0;

    switch (apiProvider.matchType){
      case 0: // last match
       day = apiProvider.lastMatchDay;
       hour = apiProvider.lastMatchHour;
       homeTeam = apiProvider.lastTeamIdHome;
       awayTeam = apiProvider.lastTeamIdAway;
       homeName = apiProvider.lastTeamNameHome;
       awayName = apiProvider.lastTeamNameAway;
       homeScore = apiProvider.lastScoreHome;
       awayScore = apiProvider.lastScoreAway;
        break;

      case 1: // next match
       day = apiProvider.nextMatchDay;
       hour = apiProvider.nextMatchHour;
       homeTeam = apiProvider.nextTeamIdHome;
       awayTeam = apiProvider.nextTeamIdAway;
       homeName = apiProvider.nextTeamNameHome;
       awayName = apiProvider.nextTeamNameAway;
       homeScore = 0;
       awayScore = 0;
        break;

      case 2: // selected match
        id = apiProvider.idMatch;
        day = apiProvider.nextMatchDay;
        hour = apiProvider.nextMatchHour;
        homeTeam = apiProvider.idHomeMatch;
        awayTeam = apiProvider.idAwayMatch;
        homeName = apiProvider.nameHomeMatch;
        awayName = apiProvider.nameAwayMatch;
        homeScore = 0;
        awayScore = 0;
        break;
    }

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
                      Text('LaLiga 2 el $day a las $hour', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
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
                  width: width,
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 55,
                        decoration: buildBoxDecoration(),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 80,
                        width: 55,
                        decoration: buildBoxDecoration(),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 80,
                        width: 55,
                        decoration: buildBoxDecoration(),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 60),

                // Statistics
                FutureBuilder(
                  future: apiProvider.getMatchStatistics(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MatchStatisticsContainer(title: 'Tiros', valueHome: apiProvider.homeShots.toString(), valueAway: apiProvider.awayShots.toString()),
                                MatchStatisticsContainer(title: 'Tiros a puerta', valueHome: apiProvider.homeShotsOnGoal.toString(), valueAway: apiProvider.awayShotsOnGoal.toString())
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MatchStatisticsContainer(title: 'Posesión', valueHome: apiProvider.homeBallPosesession, valueAway: apiProvider.awayBallPosesession,),
                                MatchStatisticsContainer(title: 'Pases', valueHome: apiProvider.homeTotalPasses.toString(), valueAway: apiProvider.awayTotalPasses.toString(),)
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MatchStatisticsContainer(title: 'Tarjetas amarillas', valueHome: apiProvider.homeYellowCards.toString(), valueAway: apiProvider.awayYellowCards.toString()),
                                MatchStatisticsContainer(title: 'Tarjetas rojas', valueHome: apiProvider.homeRedCards.toString(), valueAway: apiProvider.awayRedCards.toString())
                              ],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    );
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

