import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ngg/pages/game_page.dart';
import 'package:ngg/pages/setup_page.dart';
import 'package:ngg/pages/loading_page.dart';
import 'package:ngg/pages/start_game_page.dart';

void main() {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    // Light Mode Status Bar
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xffe7ecf1),
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const LoadingPage(),
        "startGamePage": (context) => const StartGamePage(),
        "setupPage": (context) => const SetupPage(),
        "gamePage": (context) => const GamePage(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffe7ecf1),
      ),
    );
  }
}
