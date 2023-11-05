import 'dart:async';
import 'package:dev/game/g_welcome.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../provider/global.dart';
// import 'package:lottie/lottie.dart';

class GameSplashScreen extends StatefulWidget {
  const GameSplashScreen({super.key});

  @override
  State<GameSplashScreen> createState() => _GameSplashScreenState();
}

class _GameSplashScreenState extends State<GameSplashScreen> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final global = Provider.of<GlobalPov>(context);
    Timer(Duration(seconds: 3), () {
      global.updateData("GameBegins");
    });
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                Colors.black,
                const Color.fromARGB(255, 3, 18, 43),
                Colors.black,
              ])
            ),
            child: Center(
              child: SizedBox(
                height: size.height/4,
                width: size.height/4,
                child: Image.asset("images/tik.svg.png"))
            ),
          ),
        ],
      ),
    );
  }
}