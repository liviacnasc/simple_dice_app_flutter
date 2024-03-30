import 'package:nice_dice/screens/config_screen.dart';
import 'package:nice_dice/screens/roll_history.dart';
import 'package:flutter/material.dart';

class BottomAppBarWidget extends StatefulWidget {
  const BottomAppBarWidget({super.key});

  @override
  State<BottomAppBarWidget> createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {

  void onTabSelected(Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 60,
              child: IconButton(
                icon: const Icon(Icons.history),
                onPressed: () => onTabSelected(const RollHistory()),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => onTabSelected(const ConfigScreen()),
              ),
            ),
          )
        ],
      ),
    );
  }
}
