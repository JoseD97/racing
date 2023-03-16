import 'package:flutter/material.dart';
import 'providers/providers.dart';
import 'screens/screens.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TeamProvider()),
        ChangeNotifierProvider(create: (_) => ApiProvider(), lazy: false,) // para que se inicialice de una y no espere a ser llamado
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.light().copyWith(
          primaryColorDark: Colors.green,
        ),
        home: HomeScreen(),
        routes: {
          'home': (_) => HomeScreen(),
          'matches': (_) => MatchesScreen(),
          'match': (_) => MatchScreen(),
          'team': (_) => TeamPlayersScreen(),
          'player': (_) => PlayerScreen(),
        },
      ),
    );
  }
}