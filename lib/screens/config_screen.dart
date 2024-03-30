import 'package:flutter/material.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: 
      Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Card.filled(
          
          elevation: 1.0,
          child: Container(
            padding: const EdgeInsets.all(40),
            alignment: Alignment.center,
            child: const Column(children: [
              Text("Unfinished page")
            ],),
            )
        ),
      ],
    ),
    );
  }
}

