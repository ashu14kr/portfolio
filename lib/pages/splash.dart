import 'dart:async';

import 'package:dev/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "< ",
              style: GoogleFonts.hind(
                  fontSize: size.height / 28, color: Colors.white),
            ),
            Text("Ashutosh",
                style: GoogleFonts.homemadeApple(
                    fontSize: size.height / 40, color: Colors.white)),
            Text(
              " />",
              style: GoogleFonts.hind(
                  fontSize: size.height / 28, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
