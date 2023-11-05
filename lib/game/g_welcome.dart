import 'package:dev/provider/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class GameWelcome extends StatelessWidget {
  const GameWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    final global = Provider.of<GlobalPov>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.height / 40),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          global.updateData("GExit");
                        },
                        icon: Icon(
                          Icons.close,
                          size: size.height / 20,
                          color: Colors.orange,
                        )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height / 5),
                  child: Text(
                    "Select Your Shape",
                    style: GoogleFonts.exo2(
                        color: Colors.white, fontSize: size.height / 35),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.height / 10, vertical: size.height / 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          global.updateSelectedShape("x");
                          global.updatePlayerShape("x");
                          global.updateOpponentShape("o");
                        },
                        child: Container(
                          height: size.height/12,
                          width: size.height/12,
                          decoration: BoxDecoration(
                            color: global.variable.shapeSelect == "x" ? Colors.white.withOpacity(0.3) : Colors.transparent,
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: Icon(
                            Icons.close,
                            color: const Color.fromARGB(255, 241, 100, 147),
                            size: size.height / 12,
                            shadows: [
                              Shadow(
                                color: Colors.white.withOpacity(0.8),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          global.updateSelectedShape("o");
                          global.updatePlayerShape("o");
                          global.updateOpponentShape("x");
                        },
                        child: Container(
                          height: size.height/12,
                          width: size.height/12,
                          decoration: BoxDecoration(
                            color: global.variable.shapeSelect == "o" ? Colors.white.withOpacity(0.3) : Colors.transparent,
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: Icon(
                            Icons.circle_outlined,
                            color: Color.fromARGB(255, 232, 130, 83),
                            size: size.height / 14,
                            shadows: [
                              Shadow(
                                color: Colors.white.withOpacity(0.8),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.height / 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          global.updateData("GExit");
                        },
                        child: Container(
                          height: size.height / 20,
                          width: size.width / 3.2,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.orange,
                                    Colors.red,
                                  ]),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.white.withOpacity(0.6),
                                    blurRadius: 10,
                                    spreadRadius: 1)
                              ],
                              borderRadius: BorderRadius.circular(12)),
                              child: Center(child: Text("Back", style: GoogleFonts.exo2(color: Colors.white, fontSize: size.height/50),)),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          global.updateData("Play");
                        },
                        child: Container(
                          height: size.height / 20,
                          width: size.width / 3.2,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.orange,
                                    Colors.red,
                                  ]),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.white.withOpacity(0.6),
                                    blurRadius: 10,
                                    spreadRadius: 1)
                              ],
                              borderRadius: BorderRadius.circular(12)),
                              child: Center(child: Text("Play", style: GoogleFonts.exo2(color: Colors.white, fontSize: size.height/50),)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
