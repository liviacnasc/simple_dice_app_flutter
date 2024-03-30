import 'package:flutter/material.dart';

class FABRoll extends StatefulWidget {
  
  final void Function() onPressedButton;

  const FABRoll({
    super.key,
    required this.onPressedButton,
  });

  @override
  State<FABRoll> createState() => _FABRollState();
}

class _FABRollState extends State<FABRoll> {

  
  @override
  Widget build(BuildContext context) {
    return
        FloatingActionButton.large(
          shape: const CircleBorder(),
          onPressed: widget.onPressedButton,
          tooltip: "Roll",
          elevation: 2.0,
          foregroundColor: Colors.white,
          child: const Text("ROLL", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),),
          );

  }
}