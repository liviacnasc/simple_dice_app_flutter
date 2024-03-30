import 'package:nice_dice/helper/object_box.dart';
import 'package:nice_dice/screens/homepage.dart';
import 'package:flutter/material.dart';

// main is a special function, the entry-point of the app.
// all widgets are classes
// const helps dart optimize runtime performance because it helps caching

late ObjectBox objectBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.init();

  runApp(const NiceDice());
}

class NiceDice extends StatelessWidget {
  const NiceDice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'RedditMono',
          colorScheme: const ColorScheme(
            background: Color.fromARGB(255, 22, 22, 22),
            brightness: Brightness.dark,
            primary: Color(0xFF5603AD),
            onPrimary: Colors.white,
            secondary: Color(0xFFAB5EFD),
            onSecondary: Colors.white,
            error: Color(0xFFDE2E2B),
            onError: Colors.white,
            onBackground: Colors.white,
            surface: Color.fromARGB(255, 66, 66, 66),
            onSurface: Colors.white,
          )),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
