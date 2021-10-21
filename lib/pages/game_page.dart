import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  TextEditingController userGuessController = TextEditingController();
  int randomNumber = 00;
  bool didWin = false;
  var random = Random();
  void generateRandomNumber() {
    didWin = false;
    userGuessController.clear();
    randomNumber = random.nextInt(90) + 10;
    setState(() {});
  }

  void compareGuessWithRandom(int guess) {
    if (guess == randomNumber) {
      didWin = true;
    } else {
      didWin = false;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    generateRandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "🧑 vs 🤖",
                      style: TextStyle(fontSize: 34.0),
                    ),
                  ],
                ),
              ),
              // Hidden Number
              Container(
                width: double.infinity,
                height: 200.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  color: Colors.purple,
                  gradient: LinearGradient(
                    colors: didWin == true
                        ? [
                            Color(0xffb3ffab),
                            Color(0xff12fff7),
                          ]
                        : [
                            Color(0xffff9190),
                            Color(0xfffdc094),
                          ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Random Number",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                      decoration: BoxDecoration(
                          color: didWin == true
                              ? Colors.transparent
                              : Colors.black.withOpacity(0.9),
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0))),
                      child: Text(
                        randomNumber.toString(),
                        style: TextStyle(
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Remaining Guesses:",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          "4/5",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Correct Number
              Container(
                width: double.infinity,
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  color: didWin == true ? Color(0xffb3ffab) : Color(0xfffdc094),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Correct Number",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      "2",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6.0),
              // Correct Position
              Container(
                width: double.infinity,
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  color: didWin == true ? Color(0xff12fff7) : Color(0xffff9190),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Correct Position",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      "1",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 90.0),
              // User Input
              // Input Label
              const Text(
                "Your Guess",
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 20.0),
              // Input Boxes
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 150.0),
                child: PinCodeTextField(
                  controller: userGuessController,
                  appContext: context,
                  length: 2,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    print(value);
                  },
                  textStyle: TextStyle(
                      color: didWin == true ? Color(0xff22aa27) : Colors.black),
                  enabled: !didWin,
                  pinTheme: PinTheme(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    shape: PinCodeFieldShape.circle,
                    fieldHeight: 50.0,
                    fieldWidth: 50.0,
                    disabledColor: Colors.black,
                    activeColor: Colors.lightBlue,
                    inactiveColor: Colors.lightBlue,
                    selectedColor: Colors.purple,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              // Guess Button
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(220.0, 46.0)),
                  backgroundColor: MaterialStateProperty.all(
                      didWin == true ? Color(0xff12fff7) : Color(0xffff9190)),
                ),
                onPressed: () {
                  didWin == true
                      ? generateRandomNumber()
                      : compareGuessWithRandom(
                          int.parse(userGuessController.text));
                },
                child: Text(
                  didWin == true ? "Next" : "Guess",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
