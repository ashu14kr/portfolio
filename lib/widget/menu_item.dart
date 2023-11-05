import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MenuItems extends StatefulWidget {
  const MenuItems({
    super.key,
    required this.size, required this.img, required this.name, required this.onTap,
  });

  final Size size;
  final String img;
  final String name;
  final VoidCallback onTap;

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: widget.onTap,
          child: Container(
            height: widget.size.height / 13,
            width: widget.size.height / 13,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color:
                          Colors.white.withOpacity(0.6),
                      blurRadius: 10,
                      spreadRadius: 1)
                ],
                image: DecorationImage(
                    image:
                        AssetImage(widget.img),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(
                    widget.size.height / 45)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: widget.size.height/100),
          child: Text(widget.name, style: GoogleFonts.exo(color: Colors.white, fontSize: widget.size.height/70),),
        )
      ],
    );
  }
}