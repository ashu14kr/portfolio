import 'package:dev/game/g_play.dart';
import 'package:dev/game/g_splash.dart';
import 'package:dev/game/g_welcome.dart';
import 'package:dev/pages/about_me.dart';
import 'package:dev/pages/app_portfolio.dart';
import 'package:dev/pages/home_music.dart';
import 'package:dev/pages/m_home.dart';
import 'package:dev/provider/global.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:device_frame/device_frame.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final game = Provider.of<GlobalPov>(context);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Banner(
          message: "Hire Me",
          location: BannerLocation.topEnd,
          color: Colors.orange,
          child: Stack(
            children: [
              // Container(
              //   height: size.height,
              //   width: size.width,
              //   child: Image.asset("images/matrixCode.png", fit: BoxFit.cover,),
              // ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 30),
                    child: Row(
                      children: [
                        Text(
                          "< ",
                          style: GoogleFonts.hind(
                              fontSize: size.height / 38, color: Colors.white),
                        ),
                        Text("Ashutosh",
                            style: GoogleFonts.homemadeApple(
                                fontSize: size.height / 50, color: Colors.white)),
                        Text(
                          " />",
                          style: GoogleFonts.hind(
                              fontSize: size.height / 38, color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                height: size.height,
                width: size.width,
                child: Image.asset("images/hill1.png", fit: BoxFit.cover,),
              ),
              Container(
                height: size.height,
                width: size.width,
                child: Image.asset("images/hill2.png", fit: BoxFit.cover,),
              ),
              Container(
                height: size.height,
                width: size.width,
                child: Image.asset("images/hill3.png", fit: BoxFit.cover,),
              ),
              Container(
                height: size.height,
                width: size.width,
                child: Image.asset("images/hill4.png", fit: BoxFit.cover,),
              ),
              Container(
                height: size.height,
                width: size.width,
                child: Image.asset("images/hill5.png", fit: BoxFit.cover,),
              ),
              Center(
                child: SizedBox(
                  height: size.width > 600 ? size.height / 1.05 : size.height/1.2,
                  child: DeviceFrame(
                    device: Devices.ios.iPhone13,
                    isFrameVisible: true,
                    orientation: Orientation.portrait,
                    screen: game.variable.game == "Splash"
                        ? GameSplashScreen()
                        : game.variable.game == "GameBegins"
                            ? GameWelcome()
                            : game.variable.game == "Play"
                                ? GamePlay()
                                : game.variable.game == "About_me"
                                    ? AboutMe()
                                    : game.variable.game == "favPlay"
                                        ? HomeMusic()
                                        : game.variable.game == "App_Store"
                                            ? AppPortfolio()
                                            : MobileHome(),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: IgnorePointer(
                  ignoring: true,
                  child: Container(
                    height: size.height/2,
                    width: size.width,
                    child: Image.asset("images/hill4.png", fit: BoxFit.cover,),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: IgnorePointer(
                  ignoring: true,
                  child: Container(
                    height: size.height,
                    width: size.width,
                    child: Image.asset("images/hill5.png", fit: BoxFit.cover,),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: IgnorePointer(
                  ignoring: true,
                  child: Container(
                    height: size.height,
                    width: size.width,
                    child: Image.asset("images/plant.png", fit: BoxFit.cover,),
                  ),
                ),
              ),
              size.width > 1200 ? Positioned(
                bottom: 0,
                right: 0,
                child: IgnorePointer(
                  ignoring: true,
                  child: Container(
                    height: size.height,
                    width: size.width/2,
                    child: Image.asset("images/tree.png", fit: BoxFit.cover,),
                  ),
                ),
              ) : SizedBox(),
              size.width > 1200 ? Positioned(
                bottom: 0,
                left: 200,
                child: IgnorePointer(
                  ignoring: true,
                  child: Container(
                    height: size.height,
                    width: size.width/2,
                    child: Image.asset("images/tree.png", fit: BoxFit.cover,),
                  ),
                ),
              ) : SizedBox(),
            ],
          ),
        ));
  }
}
