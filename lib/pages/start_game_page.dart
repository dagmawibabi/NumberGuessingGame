import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartGamePage extends StatefulWidget {
  const StartGamePage({Key? key}) : super(key: key);

  @override
  _StartGamePageState createState() => _StartGamePageState();
}

class _StartGamePageState extends State<StartGamePage> {
  @override
  Widget build(BuildContext context) {
    var random = Random();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedTextKit(animatedTexts: [
            TyperAnimatedText(
              "Choose size of digits",
              textStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors
                      .primaries[random.nextInt(Colors.primaries.length - 1)]),
            ),
            TyperAnimatedText(
              "Choose number of guesses",
              textStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors
                      .primaries[random.nextInt(Colors.primaries.length - 1)]),
            ),
            TyperAnimatedText(
              "Have fun guessing the number!",
              textStyle: TextStyle(
                  fontSize: 22.0,
                  color: Colors
                      .primaries[random.nextInt(Colors.primaries.length - 1)]),
            ),
          ]),
          const SizedBox(height: 40.0),
          Image.asset("assets/images/numbers_block.png"),
          const SizedBox(height: 150.0),
          // Start Game Button
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, "setupPage");
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(100.0),
                ),
                gradient: LinearGradient(
                  colors: [Color(0xff401dee), Color(0xff6c58ce)],
                ),
              ),
              child: const Text(
                "Start Game",
                style: TextStyle(
                  color: Color(0xffe7ecf1),
                  fontSize: 22.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          // Exit button
          TextButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: const Text(
              "EXIT GAME",
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
