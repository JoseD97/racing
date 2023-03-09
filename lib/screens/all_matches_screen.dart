import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:racing/screens/screens.dart';

import '../providers/api_provider.dart';
import '../widgets/widgets.dart';

class AllMatchesScreen extends StatelessWidget {
  const AllMatchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context);

    // TODO METER TODO EN UN FUTURE BUILDER
    return Scaffold(
        body: SafeArea(
          child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverPersistentHeader(
                    floating: true,
                    delegate: _SliverCustomHeaderDelegate(
                        70,
                        100,
                        Container(
                            width: double.infinity,
                            color: Colors.white70,
                            padding: const EdgeInsets.only(top: 35, left: 15),
                            child: const Text('Partidos de la LaLiga2', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                        )
                    )
                ),

                FutureBuilder(
                  future: apiProvider.getAllMatches(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: apiProvider.totMatches,
                          (context, i) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(25)),
                                color: Colors.green,
                              ),
                                child: ListTile(
                                  leading: SizedBox(width: 60, child: Text('Jornada ${i+1}', textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
                                  trailing: SizedBox(width: 60, child: Text(apiProvider.matchDay[i], textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                    TeamsShield(
                                      teamId: apiProvider.teamIdHome[i].toString(),
                                      width: 40,
                                      height: 40
                                    ),
                                    Text('${apiProvider.teamScoreHome[i].toString()} - ${apiProvider.teamScoreAway[i].toString()}', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                    TeamsShield(
                                      teamId: apiProvider.teamIdAway[i].toString(),
                                      width: 40,
                                      height: 40
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    apiProvider.idMatch = apiProvider.teamIdMatch[i];
                                    apiProvider.idMatch = apiProvider.teamIdMatch[i];
                                    apiProvider.idMatch = apiProvider.teamIdMatch[i];
                                    apiProvider.idMatch = apiProvider.teamIdMatch[i];
                                    apiProvider.idMatch = apiProvider.teamIdMatch[i];
                                    PersistentNavBarNavigator.pushNewScreen(
                                    context,
                                    screen: const MatchScreen(),
                                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                    );
                                },

                                ),
                              ),
                            )


                          ),
                    );
                  },
                )
              ]
          ),
        )
    );
  }
}



class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate{
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate(this.minHeight, this.maxHeight, this.child);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||   // Condicion para redibujar
        minHeight != oldDelegate.minHeight ||
        child     != oldDelegate.child;
  }

}