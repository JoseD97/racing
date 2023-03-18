import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:racing/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> _buildScreens() {
      return [
        const MatchesScreen(),
        const TableScreen(),
        const TeamPlayersScreen(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const FaIcon(FontAwesomeIcons.solidFutbol),
          title: ("Partidos"),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white60,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "matches",
            routes: {
              "/match": (final context) => const MatchScreen(),
              "/allMatches": (final context) => const AllMatchesScreen(),
            },
          ),
        ),
        PersistentBottomNavBarItem(
          icon: const FaIcon(FontAwesomeIcons.trophy),
          title: ("Clasificación"),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white60,
        ),
        PersistentBottomNavBarItem(
          icon: const FaIcon(FontAwesomeIcons.peopleGroup),
          title: ("Jugadores"),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white60,
        ),
      ];
    }

    PersistentTabController controller;
    controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Theme.of(context).primaryColorDark, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: const NavBarDecoration(
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}


