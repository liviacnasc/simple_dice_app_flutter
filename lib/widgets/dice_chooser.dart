import 'package:nice_dice/model/dice.dart';
import 'package:nice_dice/widgets/dice_selector.dart';
import 'package:flutter/material.dart';

class DiceChooser extends StatefulWidget {
  const DiceChooser({
    super.key,
    required this.incrementDice,
    required this.decrementDice
  });

  final void Function(Dice dice) incrementDice;
  final void Function() decrementDice;


  @override
  State<DiceChooser> createState() => _DiceChooserState();
}

class _DiceChooserState extends State<DiceChooser> {
  final _dice = ValueNotifier<Dice>(Dice(sides: 4));
  bool hasClients = false;

  void onDiceChanged(Dice dice) {
    _dice.value = dice;
    hasClients = true;
  }

  void onIncrementPressed(Dice dice){
    widget.incrementDice(dice);
  }

  void onDecrementPressed(){
    widget.decrementDice();
  }


  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
          DiceSelector(onDiceChanged: onDiceChanged),
         _diceInfo(),
      ]);
     
  }

  Widget _diceInfo() {
    return ValueListenableBuilder(valueListenable: _dice, builder: (context, dice, child){
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                onPressed: !hasClients  ? null : onDecrementPressed,
                icon: const Icon(Icons.exposure_minus_1
              )),
              Text(dice.name, style: const TextStyle(color: Colors.white, fontSize: 24),),
              IconButton(
                onPressed: !hasClients  ? null : () => onIncrementPressed(_dice.value),
                icon: const Icon(Icons.plus_one
              )),
              
            ],
          ),
        ],
      );
    });
  }
}