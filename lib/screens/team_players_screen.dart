import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:racing/screens/player_screen.dart';

import '../providers/providers.dart';

class TeamPlayersScreen extends StatelessWidget {
  const TeamPlayersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final apiProvider = Provider.of<ApiProvider>(context);
    final teamProvider = Provider.of<TeamProvider>(context);

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
                        child: const Text('Jugadores', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                    )
                )
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: apiProvider.totPlayers,
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
                        title: Text(apiProvider.playersName[i], style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
                        onTap: () {
                          teamProvider.idPlayer = apiProvider.playersId[i];
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const PlayerScreen(),
                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          );
                        },
                        leading: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(100)),
                          child: FadeInImage(
                            fit: BoxFit.cover,
                            placeholder: const AssetImage('assets/teams_shield.jpg'),
                            image: NetworkImage(apiProvider.playersPhoto[i]),
                          ),
                        ),
                      ),
                    ),
                  ),
              ),
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