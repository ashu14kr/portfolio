import 'package:dev/provider/global.dart';
import 'package:flutter/material.dart';
import 'package:dev/widget/menu_item.dart';
import 'package:dev/globalv.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class MobileHome extends StatefulWidget {
  const MobileHome({super.key});

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {

  GlobalVariable variable = GlobalVariable();

  @override
  Widget build(BuildContext context) {
    final global = Provider.of<GlobalPov>(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Colors.orange,
            Colors.red,
            Colors.black,
          ])),
      child: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: size.height / 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.height / 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: size.height / 5.2,
                  width: size.height / 5.2,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white.withOpacity(0.6),
                            blurRadius: 10,
                            spreadRadius: 1)
                      ],
                      image: DecorationImage(
                          image: AssetImage("images/Stocks.jpeg")),
                      borderRadius: BorderRadius.circular(size.height / 35)),
                ),
                InkWell(
                  onTap: () {
                    global.updateData("favPlay");
                  },
                  child: Container(
                    height: size.height / 5.2,
                    width: size.height / 5.2,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white.withOpacity(0.6),
                              blurRadius: 10,
                              spreadRadius: 1)
                        ],
                        image: DecorationImage(
                            image: AssetImage("images/spotify.jpeg")),
                        borderRadius: BorderRadius.circular(size.height / 35)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height / 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.height / 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MenuItems(
                  size: size,
                  img: "images/MyImg.png",
                  name: "About Me",
                  onTap: () {
                    global.updateData("About_me");
                  },
                ),
                MenuItems(
                  size: size,
                  img: "images/LinkedIn.png",
                  name: "LinkedIn",
                  onTap: () async {
                    await launchUrl(Uri.parse("https://www.linkedin.com/in/ashutosh-kumar-737018216/"));
                  },
                ),
                MenuItems(
                  size: size,
                  img: "images/game.png",
                  name: "Play Game",
                  onTap: () {
                    global.updateData("Splash");
                  },
                ),
                MenuItems(
                  size: size,
                  img: "images/github.png",
                  name: "Github",
                  onTap: () async{
                    await launchUrl(Uri.parse("https://github.com/ashu14kr"));
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height / 40,
          ),
          Padding(
            padding: EdgeInsets.only(left: size.height / 30, right: size.height / 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MenuItems(
                  size: size,
                  img: "images/twitter.png",
                  name: "Twitter",
                  onTap: () async {
                    await launchUrl(Uri.parse("https://twitter.com/ashu14kr"));
                  },
                ),
                MenuItems(
                  size: size,
                  img: "images/appStore.png",
                  name: "App Store",
                  onTap: () {
                    global.updateData("App_Store");
                  },
                ),
                MenuItems(
                  size: size,
                  img: "images/instagram.png",
                  name: "Instagram",
                  onTap: () async{
                    await launchUrl(Uri.parse("https://www.instagram.com/aasshhuutosh/"));
                  },
                ),
                MenuItems(
                  size: size,
                  img: "images/email.png",
                  name: "E-mail",
                  onTap: () {
                    EasyLoading.showToast("ashuh14th@gmail.com");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}
