import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {

  final double height;

  const BackgroundContainer({
    Key? key,
    required this.height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
          color: Colors.green
      ),
    );
  }
}
