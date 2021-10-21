import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({Key? key}) : super(key: key);

  @override
  _SetupPageState createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  int curDigitValue = 3;
  int curGuessValue = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            "⚙",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 36.0),
          ),
          const SizedBox(height: 20.0),
          const Text(
            "Setup Game",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22.0),
          ),
          // Illuistration
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Image.asset("assets/images/numbers_block2.png"),
          ),
          // Digits
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Digits: ",
                  style: TextStyle(fontSize: 20.0),
                ),
                NumberPicker(
                  selectedTextStyle: const TextStyle(
                    color: Colors.blue,
                    fontSize: 24.0,
                  ),
                  itemWidth: 50.0,
                  axis: Axis.horizontal,
                  value: curDigitValue,
                  minValue: 1,
                  maxValue: 5,
                  onChanged: (value) => setState(() => curDigitValue = value),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          // Guesses
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Guesses: ",
                  style: TextStyle(fontSize: 20.0),
                ),
                NumberPicker(
                  selectedTextStyle: const TextStyle(
                    color: Colors.blue,
                    fontSize: 24.0,
                  ),
                  itemWidth: 50.0,
                  axis: Axis.horizontal,
                  value: curGuessValue,
                  minValue: 1,
                  maxValue: 100,
                  onChanged: (value) => setState(() => curGuessValue = value),
                ),
              ],
            ),
          ),
          const SizedBox(height: 90.0),
          // Begin Game Button
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "gamePage");
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
                "Begin",
                style: TextStyle(
                  color: Color(0xffe7ecf1),
                  fontSize: 22.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 100.0),
        ],
      ),
    );
  }
}
