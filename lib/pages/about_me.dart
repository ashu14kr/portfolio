import 'package:dev/globalv.dart';
import 'package:dev/provider/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GlobalVariable _variable = GlobalVariable();
    final global = Provider.of<GlobalPov>(context);
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
                    Color.fromARGB(255, 16, 111, 188),
                    const Color.fromARGB(255, 4, 42, 73),
                    Colors.black,
                  ]),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.height / 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "About Me",
                          style: GoogleFonts.exo2(
                              fontSize: size.height / 40, color: Colors.white),
                        ),
                        IconButton(
                            onPressed: () {
                              global.updateData("exit");
                            },
                            icon: Icon(
                              Icons.close,
                              size: size.height / 30,
                              color: Color.fromARGB(255, 255, 255, 255),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height/30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.height/40),
                    child: Container(
                      height: size.height / 1.23,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white.withOpacity(0.05),
                                blurRadius: 2,
                                spreadRadius: 1)
                          ]),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: size.height/50, bottom: size.height/50,),
                                child: CircleAvatar(
                                  radius: size.height/12,
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage("images/MyImg.png"),
                                ),
                              ),
                              Text("Hi, I am Ashutosh Kumar", style: GoogleFonts.exo2(color: Colors.white, fontSize: size.height/35),),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: size.height/60, vertical: size.height/40),
                                child: Container(
                                  height: size.height/5.5,
                                  child: Text(_variable.about_me1, style: GoogleFonts.exo2(color: Colors.white, fontSize: size.height/55)),),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: size.height/60, vertical: size.height/40),
                                child: Container(
                                  height: size.height/4.8,
                                  child: Text(_variable.about_me2, style: GoogleFonts.exo2(color: Colors.white, fontSize: size.height/55)),),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: size.height/60, vertical: size.height/40),
                                child: Container(
                                  height: size.height/3.3,
                                  child: Text(_variable.about_me3, style: GoogleFonts.exo2(color: Colors.white, fontSize: size.height/55)),),
                              ),
                            ],
                          ),
                        ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
