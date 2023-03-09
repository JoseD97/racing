import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../widgets/widgets.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final apiProvider = Provider.of<ApiProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundContainer(height: 250),
            FutureBuilder(
              future: apiProvider.getPlayerStatistics(apiProvider.idPlayer),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if(snapshot.hasData){
                  return Center(
                    child: Column(
                      children: [
                        // Photo
                        Container(
                          margin: const EdgeInsets.only(top: 40),
                          height: 100,
                          width: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: FadeInImage(
                              fit: BoxFit.cover,
                              placeholder: const AssetImage('assets/teams_shield.jpg'),
                              image: NetworkImage(apiProvider.playerPhoto),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        Text(apiProvider.playerName, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20)),
                        const SizedBox(height: 10),
                        Text(apiProvider.playerPosition, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15)),
                        const SizedBox(height: 30),

                        // Statistics
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    PlayerStatisticsContainer(title: 'Partidos Jugados', value: apiProvider.playerGames.toString()),
                                    PlayerStatisticsContainer(title: 'Rating', value: apiProvider.playerRating)
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    PlayerStatisticsContainer(title: 'Tarjetas Amarillas', value: apiProvider.playerYellowCards.toString()),
                                    PlayerStatisticsContainer(title: 'Tarjetas Rojas', value: apiProvider.playerRedCards.toString())
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    PlayerStatisticsContainer(title: 'Pases', value: apiProvider.playerPasses.toString()),
                                    PlayerStatisticsContainer(title: 'Goles', value: apiProvider.playerGoals.toString())
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
                else if(snapshot.hasError){
                  return const Center(child: Text('Ha habido un error'));
                }
                else {
                  return const Center(child: CircularProgressIndicator());
                } // Is loading
              },
            )
          ],
        ),
      ),
    );
  }
}