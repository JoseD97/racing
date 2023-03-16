import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../widgets/widgets.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final apiProvider = Provider.of<ApiProvider>(context);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      // bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              height: 50,
              color: Colors.green,
              child: const Text('LaLiga 2', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 50,
              color: Colors.green,
              child: Row(
                children: [
                  SizedBox(width: width * 0.10, child: const Text('Pos', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white,))),
                  SizedBox(width: width * 0.10,), // foto
                  SizedBox(width: width * 0.30, child: const Text('Equipo', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                  SizedBox(width: width * 0.15, child: const Text('P.J.', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                  SizedBox(width: width * 0.15, child: const Text('D.G.', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                  SizedBox(width: width * 0.15, child: const Text('Pts.', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                  itemCount: (apiProvider.rankTeamId.isNotEmpty) ? 22 : 0,
                  itemBuilder: (context, i){
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: width * 0.10, child: Text((i + 1).toString(),textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: (apiProvider.rankTeamId[i] == 4665) ? Colors.green : Colors.black))),
                              TeamsShield(
                                width: width * 0.10,
                                height: width * 0.075,
                                teamId: apiProvider.rankTeamId[i].toString(),
                                ),
                              SizedBox(width: width * 0.30, child: Text(apiProvider.teamName[i],textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: (apiProvider.rankTeamId[i] == 4665) ? Colors.green : Colors.black))),
                              SizedBox(width: width * 0.15, child: Text(apiProvider.matchesPlayed[i].toString(),textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: (apiProvider.rankTeamId[i] == 4665) ? Colors.green : Colors.black))),
                              SizedBox(width: width * 0.15, child: Text(apiProvider.goalsDiff[i].toString(),textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: (apiProvider.rankTeamId[i] == 4665) ? Colors.green : Colors.black))),
                              SizedBox(width: width * 0.15, child: Text(apiProvider.points[i].toString(),textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: (apiProvider.rankTeamId[i] == 4665) ? Colors.green : Colors.black))),
                            ],
                          ),
                        )
                      ],
                    );
                  }
              ),
            ),
          ]
        ),
      ),
    );
  }
}