import 'package:flutter/material.dart';

class DiceContainer extends StatelessWidget {
  final String sides;
  final String imagePath;

  final VoidCallback? onDiceSelected;

  const DiceContainer(
      {super.key,
      required this.sides,
      required this.imagePath,
      this.onDiceSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onDiceSelected,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: SizedBox(
            width: 200,
            child: Image.asset(imagePath),
            ),
          ),
        ),
      );
  }
}
