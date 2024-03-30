import 'package:nice_dice/main.dart';
import 'package:nice_dice/model/roll.dart';
import 'package:flutter/material.dart';

class RollHistory extends StatefulWidget {
  const RollHistory({super.key});

  @override
  State<RollHistory> createState() => _RollHistoryState();
}

class _RollHistoryState extends State<RollHistory> {
  late Stream<List<Roll>> streamRolls;

  @override
  void initState() {
    super.initState();

    streamRolls = objectBox.getRolls();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("History"),),
      body: _listView(),
    );
  }

  Widget _listView(){
    return StreamBuilder<List<Roll>>(
      stream: streamRolls,
      builder: (context, snapshot) {
        if(!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
            );
        }else {
          final rolls = snapshot.data!;
          return ListView.separated(
            itemCount: rolls.length,
            itemBuilder: (BuildContext context, int index) {
              final roll = rolls[index];

              return ListTile(
                leading: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      roll.total.toString(),
                      style: const TextStyle(fontSize: 20),
                      ), const Text("TOTAL")],),
                title: Text("RESULTS: ${roll.diceRolls.toString()}"),
                subtitle: Text("DICES ROLLED: ${roll.dicesRolled.toString()}"),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            
          );
        }
      });
  }
}