import 'package:flutter/material.dart';
import 'package:dev/provider/global.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class GamePlay extends StatelessWidget {
  const GamePlay({super.key});

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
                          global.playAgain();
                        },
                        icon: Icon(
                          Icons.close,
                          size: size.height / 20,
                          color: Colors.orange,
                        )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height / 20),
                  child: Text(
                    global.game.result == "" ? "Lets Play" : global.game.result,
                    style: GoogleFonts.exo2(
                        color: Colors.white, fontSize: size.height / 35),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height / 20),
                  child: SizedBox(
                    height: size.height / 2.3,
                    width: size.width,
                    child: GridView.builder(
                      itemCount: 9,
                      padding: EdgeInsets.all(size.height / 40),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            global.play(index);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(size.height / 100),
                            child: Container(
                                height: size.height / 12,
                                width: size.height / 12,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(16)),
                                child: global.game.board[index] == ""
                                    ? Container()
                                    : global.game.board[index] == "o"
                                        ? Icon(
                                            Icons.circle_outlined,
                                            color: Color.fromARGB(
                                                255, 232, 130, 83),
                                            size: size.height / 14,
                                            shadows: [
                                              Shadow(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                blurRadius: 10,
                                              ),
                                            ],
                                          )
                                        : Icon(
                                            Icons.close,
                                            color: const Color.fromARGB(
                                                255, 241, 100, 147),
                                            size: size.height / 12,
                                            shadows: [
                                              Shadow(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                blurRadius: 10,
                                              ),
                                            ],
                                          )),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.height / 40, vertical: size.height / 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          global.updateData("GExit");
                          global.playAgain();
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
                          child: Center(
                              child: Text(
                            "Back",
                            style: GoogleFonts.exo2(
                                color: Colors.white,
                                fontSize: size.height / 50),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          global.playAgain();
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
                          child: Center(
                              child: Text(
                            "Play Again",
                            style: GoogleFonts.exo2(
                                color: Colors.white,
                                fontSize: size.height / 50),
                          )),
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
