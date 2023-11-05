import 'package:dev/provider/global.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class HomeMusic extends StatefulWidget {
  const HomeMusic({super.key});

  @override
  State<HomeMusic> createState() => _HomeMusicState();
}

class _HomeMusicState extends State<HomeMusic> {
  var audioPlay = false;
  Duration duration = Duration();
  Duration position = Duration();
  AudioPlayer player = AudioPlayer();
  double v = 0.00;

  @override
  void didChangeDependencies() {
    player.onPositionChanged.listen((Duration p) {
      setState(() {
        position = p;
      });
      player.onPlayerComplete.listen((event) {
        position = Duration();
        audioPlay = false;
      });
    });
    player.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final global = Provider.of<GlobalPov>(context);
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 42, 41, 41),
                  Color.fromARGB(249, 32, 31, 31),
                  Colors.black,
                ]),
          ),
        ),
        SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.height/40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height / 40,
                      width: size.height / 40,
                    ),
                    Text(
                      "Wiz Khalifa",
                      style: GoogleFonts.exo2(color: Colors.white),
                    ),
                    IconButton(
                        onPressed: () {
                          global.updateData("Exit");
                        },
                        icon: Icon(
                          Icons.close,
                          size: size.height / 30,
                          color: Color.fromARGB(255, 255, 255, 255),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height / 18, left: size.height/30, right: size.height/30),
                child: Container(
                  height: size.height / 2.6,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage("images/see_you_again.png"),
                          fit: BoxFit.cover)),
                ),
              ),
              SizedBox(
                height: size.height / 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.height / 40),
                child: Text(
                  "See You Again (feat. Charlie Puth)",
                  style: GoogleFonts.exo2(
                      color: Colors.white, fontSize: size.height / 40),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.height / 40),
                child: Text(
                  "Wiz Khalifa, Charlie Puth",
                  style: GoogleFonts.exo2(
                      color: Colors.grey, fontSize: size.height / 55),
                ),
              ),
              SizedBox(
                height: size.height / 30,
              ),
              SizedBox(
                width: size.width,
                child: Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(), 
                  activeColor: Color.fromARGB(255, 35, 35, 35),
                  inactiveColor: Color.fromARGB(255, 56, 55, 55),
                  onChanged: (v)async{
                    final p = Duration(seconds: v.toInt());
                    await player.seek(p);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.height / 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      position.toString().replaceRange(6, 13, ""),
                      style: GoogleFonts.exo2(
                          color: Color.fromARGB(255, 105, 103, 103),
                          fontSize: size.height / 70),
                    ),
                    Text(
                      duration.toString().replaceRange(6, 13, ""),
                      style: GoogleFonts.exo2(
                          color: Color.fromARGB(255, 105, 103, 103),
                          fontSize: size.height / 70),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height / 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_previous_rounded,
                      color: Colors.white,
                      size: size.height / 13,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      if (!audioPlay) {
                        await player.play(AssetSource("images/music.mp3"));
                        setState(() {
                          audioPlay = true;
                          position = Duration(seconds: 0);
                        });
                      } else {
                        await player.pause();
                        setState(() {
                          audioPlay = false;
                        });
                      }
                    },
                    icon: Icon(
                      audioPlay == false
                          ? Icons.play_circle_fill_rounded
                          : Icons.pause_circle_outline_rounded,
                      color: Colors.white,
                      size: size.height / 13,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_next_rounded,
                      color: Colors.white,
                      size: size.height / 13,
                    ),
                  ),
                ],
              )
            ],
          ),
        ))
      ],
    ));
  }
}
