import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

  void abrirUrl() async {
    const url = 'https://github.com/liviacnasc/simple_dice_app_flutter';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Card.filled(
              elevation: 2.0,
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: Image.asset("assets/images/icon.png"),
                title: const Text(
                  "NiceDice",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("version 1.0.0"),
              )),
          Column(
            children: <Widget>[
              const ListTile(
                contentPadding: EdgeInsets.all(30),
                leading: Icon(Icons.question_mark),
                title: Text(
                  "How do I use this app?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                    "Pick the dices and click ROLL when you're ready. The app will display the result."),
              ),
              const ListTile(
                contentPadding: EdgeInsets.all(30),
                leading: Icon(Icons.question_mark),
                title: Text(
                  "How do I contribute with this project?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Check the project's GitHub repository!"),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton.icon(
                    style: const ButtonStyle(
                      iconColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    onPressed: abrirUrl,
                    icon: const Icon(LucideIcons.github), 
                    label: const Text("GitHub", style: TextStyle(color: Colors.white),)),
              ],)
            ],
          )
        ],
      ),
    );
  }
}
