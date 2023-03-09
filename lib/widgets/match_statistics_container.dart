import 'package:flutter/material.dart';

class MatchStatisticsContainer extends StatelessWidget {

  final String title;
  final String valueHome;
  final String valueAway;

  const MatchStatisticsContainer({Key? key,
    required this.title,
    required this.valueHome,
    required this.valueAway
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(20),
      height: 165,
      width: 165,
      decoration: buildBoxDecoration(),
      child: Column(
        children: [
          SizedBox(
            height: 45,
            child: Center(
              child: Text(title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white, ))
            )
          ),
          const Divider(color: Colors.white, thickness: 1),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Local', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
              Text(valueHome, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Visitante', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
              Text(valueAway, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
            ],
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(25)
    );
  }

}