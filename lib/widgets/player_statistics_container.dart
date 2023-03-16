import 'package:flutter/material.dart';

class PlayerStatisticsContainer extends StatelessWidget {

  final String title;
  final String value;

  const PlayerStatisticsContainer({
    Key? key,
    required this.title,
    required this.value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      height: 120,
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
          Center(child: Text(value, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white, )))
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
