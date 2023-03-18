import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:racing/providers/api_provider.dart';
import 'package:racing/screens/all_matches_screen.dart';
import 'package:racing/screens/match_screen.dart';

import '../widgets/widgets.dart';


class MatchesScreen extends StatelessWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: true,
          top: true,
          left: false,
          right: false,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 20),
                Text('Último Partido', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 20),
                LastGameScore(),
                SizedBox(height: 50),

                Text('Siguiente partido', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 20),
                _NextGame(),
                SizedBox(height: 50),

                Text('Partidos', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 20),
                _Matches(),
              ],
            ),
          ),
        ),
      )
    );
  }

}


/// Last Match
class LastGameScore extends StatelessWidget {
  const LastGameScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final apiProvider = Provider.of<ApiProvider>(context);
    final width = MediaQuery.of(context).size.width;

    return StackContainer(
      matchId: apiProvider.lastMatchId,
      matchType: 0,
      navScreen: const MatchScreen(),
      icon: FontAwesomeIcons.futbol,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: Container(
                width: width * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TeamsShield(
                        teamId: apiProvider.lastTeamIdHome.toString(),
                        width: 60,
                        height: 60
                    ),
                    const SizedBox(height: 10),
                    Text(apiProvider.lastTeamNameHome, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white), overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ),

            Text(apiProvider.lastScoreHome.toString(), style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
            const Text(' - ', style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
            Text(apiProvider.lastScoreAway.toString(), style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),

            Flexible(
              child: Container(
                width: width * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TeamsShield(
                        teamId: apiProvider.lastTeamIdAway.toString(),
                        width: 60,
                        height: 60
                    ),
                    const SizedBox(height: 10),
                    Text(apiProvider.lastTeamNameAway, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white), overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}



/// Next match
class _NextGame extends StatelessWidget {
  const _NextGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context);
    final width = MediaQuery.of(context).size.width;
    return StackContainer(
      matchId: apiProvider.nextMatchId,
      matchType: 1,
      navScreen: MatchScreen(),
      icon: FontAwesomeIcons.calendar,
      child: Center(

        /// Team shield
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 150,
              width: width * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TeamsShield(
                      teamId: apiProvider.nextTeamIdHome.toString(),
                      width: 60,
                      height: 60
                  ),
                  const SizedBox(height: 10),
                  TeamsShield(
                      teamId: apiProvider.nextTeamIdAway.toString(),
                      width: 60,
                      height: 60
                  ),
                ],
              ),
            ),

            /// Team Name
            Flexible(
              child: SizedBox(
                height: 140,
                width: width * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(apiProvider.nextTeamNameHome, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white), overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 50),
                    Text(apiProvider.nextTeamNameAway, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white), overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ),

            /// Game data
            Flexible(
              child: SizedBox(
                height: 150,
                width: width * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(apiProvider.nextMatchDay, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white), overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 16),
                    Text(apiProvider.nextMatchHour, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white), overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 16),
                    const Center(child: Text('LaLiga 2', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white), overflow: TextOverflow.ellipsis,)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/// All matches
class _Matches extends StatelessWidget {
  const _Matches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StackContainer(
      matchId: 2,
      matchType: 2,
      navScreen: const AllMatchesScreen(),
      icon: FontAwesomeIcons.listOl,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(width: 25,),
            TeamsShield(
                teamId: '4665',
                width: 80,
                height: 80
            ),
            SizedBox(width: 30,),
            Text('Todos los partidos', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white)),
        ]
        ),
      ),
    );
  }
}

