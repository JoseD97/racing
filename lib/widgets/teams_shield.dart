import 'package:flutter/material.dart';


class TeamsShield extends StatelessWidget {

  final String teamId;
  final double height;
  final double width;

  const TeamsShield({
    Key? key,
    required this.teamId,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: height,
          width: width,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: (teamId == '4665') // Racing's id
                ? Image.asset('assets/racing_shield.png')
                : FadeInImage(
                  fit: BoxFit.contain,
                  placeholder: const AssetImage('assets/teams_shield.jpg'),
                  image: NetworkImage('https://media.api-sports.io/football/teams/$teamId.png?x-rapidapi-key=bf881c6a187196902abf5e35189a569c&x-rapidapi-host=media.api-sports.io'),
                )
          ),
        ),
      ]
    );
  }
}