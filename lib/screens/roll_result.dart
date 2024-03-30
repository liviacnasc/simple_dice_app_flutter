import 'package:nice_dice/model/roll.dart';
import 'package:flutter/material.dart';

class RollResultPage extends StatelessWidget {
  final Roll roll;

  late final String total;
  late final String modifier;
  late final String dicesRolls;
  late final String dicesRolled;

  RollResultPage({required this.roll, super.key}) {
    total = roll.total.toString();
    modifier = roll.modifier.toString();
    dicesRolls = roll.diceRolls.toString();
    dicesRolled = roll.dicesRolled.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xED221F1C),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xED161412),
      body: Center(
          child: _resultBody()
        ),
    );
  }

  Widget _resultBody(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text("TOTAL"),
        Text(
          total,
          style: const TextStyle(fontSize: 76, color: Colors.white),
        ),
        const Text("RESULTS"),
        Text(
            dicesRolls,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        const Text("DICES ROLLED"),
        Text(
            dicesRolled,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
      ],
    );
  }
}
