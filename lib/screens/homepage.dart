import 'dart:math';

import 'package:nice_dice/main.dart';
import 'package:nice_dice/model/dice.dart';
import 'package:nice_dice/model/roll.dart';
import 'package:nice_dice/screens/roll_result.dart';
import 'package:nice_dice/widgets/bottom_app_bar.dart';
import 'package:nice_dice/widgets/dice_chooser.dart';
import 'package:nice_dice/widgets/fab_roll.dart';
import 'package:flutter/material.dart';

final randomizer = Random();


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Dice> dices = [];
  final List<String> dicesNames = [];

  final roll = ValueNotifier<Roll>(Roll(
    diceRolls: [],
    modifier: 0,
    total: 0,
    dicesRolled: []
  ));

  void onPressedButton(){
    if (dices.isNotEmpty) {
      List<int> result = [];
      List<String> dicesRolledText =  List.generate(dices.length, (index) {
        return dices[index].name;
      });
      
      int total = 0;
      int modifier = 0;
      for (var element in dices) {
        int random = randomizer.nextInt(element.sides + 1);
        result.add(random);
        total += random;
      }
      
      roll.value = Roll(
        diceRolls: result,
        total: total + modifier,
        modifier: modifier,
        dicesRolled: dicesRolledText
      );
      
      objectBox.insertRoll(roll.value);
      Navigator.push(context, MaterialPageRoute(builder: (context) => RollResultPage(roll: roll.value)));
    }

  }

  void onTabSelected(Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  void incrementDice(Dice dice){
    dices.add(dice);
    setState(() {
      dicesNames.add(dice.name);
    });
  }

  void decrementDice(){
    dices.removeLast();
    setState(() {
      dicesNames.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _diceChooser(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FABRoll(onPressedButton: onPressedButton,),
      bottomNavigationBar: const BottomAppBarWidget(),
    );
  }
  Widget _diceChooser() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        DiceChooser(
        incrementDice: incrementDice,
        decrementDice: decrementDice,),
        Text("Picked: ${dicesNames.toString()}", style: const TextStyle(fontSize: 11, color: Colors.white),)
      ],
    );
  }
}

