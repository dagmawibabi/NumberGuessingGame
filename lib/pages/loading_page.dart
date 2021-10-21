import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  void load() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "startGamePage");
    });
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            "assets/images/splash_screen.png",
          ),
          const SizedBox(height: 210.0),
          const Text(
            "Made with 🖤 by Dream Intelligence!",
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
