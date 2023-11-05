import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

import '../provider/global.dart';

class AppPortfolio extends StatelessWidget {
  const AppPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final global = Provider.of<GlobalPov>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(color: Colors.black),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.height / 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Apps Showroom",
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
                    height: size.height / 30,
                  ),
                  AppCard(
                    size: size,
                    img: "images/presem.png",
                    name: "Pesem ~ Music Player 2021",
                    type: "Preceptor Entertainment",
                    onTap: ()async{
                      await launchUrl(Uri.parse("https://play.google.com/store/apps/details?id=com.arenaclash.music_player"));
                    },
                  ),
                  AppCard(
                    size: size,
                    img: "images/evnt.png",
                    name: "EvntNinja - Party Planner",
                    type: "Preceptor Events",
                    onTap: ()async{
                      await launchUrl(Uri.parse("https://play.google.com/store/apps/details?id=com.easy.wed_me&pli=1"));
                    },
                  ),
                  AppCard(
                    size: size,
                    img: "images/Vupdate.jpg",
                    name: "Vupdate",
                    type: "Preceptor Management",
                    onTap: ()async{
                      await launchUrl(Uri.parse("https://play.google.com/store/apps/details?id=com.easy.wed_me&pli=1"));
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.size,
    required this.img,
    required this.name,
    required this.type, required this.onTap,
  });

  final Size size;
  final String img;
  final String name;
  final String type;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.height / 30, vertical: size.height / 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: size.height / 15,
                  width: size.height / 15,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                          image: AssetImage(img), fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.6),
                          blurRadius: 6,
                          spreadRadius: 3,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(16)),
                ),
                SizedBox(
                  width: size.height/45,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: GoogleFonts.exo2(
                            color: Colors.white, fontSize: size.height / 55)),
                    Text(type,
                        style: GoogleFonts.exo2(
                            color: Colors.grey, fontSize: size.height / 65)),
                    Text("Installed",
                        style: GoogleFonts.exo2(
                            color: Colors.grey, fontSize: size.height / 65)),
                  ],
                ),
              ],
            ),
            InkWell(
              onTap: onTap,
              child: Container(
                height: size.height / 40,
                width: size.height / 16,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 48, 145, 224),
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.4),
                        blurRadius: 3,
                        spreadRadius: 1,
                      )
                    ]),
                child: Center(
                    child: Text(
                  "View",
                  style: GoogleFonts.aBeeZee(
                      color: Colors.white, fontSize: size.height / 70),
                )),
              ),
            )
          ],
        ));
  }
}
