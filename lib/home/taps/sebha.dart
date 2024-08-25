import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/my_theme_data.dart';
import 'package:provider/provider.dart';

import '../../providers/my_provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int currentIndex = 0;
  double routationAngle = 0;

  List<String> tasbeehText = ['سبحان الله', 'الحمد لله', 'الله اكبر'];

  void tesbeehCount() {
    setState(() {
      counter++;
      routationAngle += -28.76 * pi / 180;
      if (counter == 33) {
        counter = 0;
        currentIndex = (currentIndex + 1) % tasbeehText.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var provi= Provider.of<MyProvider>(context);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: EdgeInsets.only(top: 106),
                child: Transform.rotate(
                  angle: routationAngle,
                  child: Image.asset(
                    provi.mode==ThemeMode.light?'assets/images/body_sebha.png':'assets/images/body_sebha_dark.png',
                    height: 234,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 28, left: 45),
                child: Image.asset(
                  provi.mode==ThemeMode.light? 'assets/images/head_sebha_logo.png':'assets/images/head_sebha_dark.png',
                  height: 105,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "عدد التسبيحات ",
              style: GoogleFonts.elMessiri(
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 69,
            height: 81,
            margin: EdgeInsets.only(left: 150, right: 150),
            decoration: BoxDecoration(
                color: provi.mode==ThemeMode.light?primaryColor:primaryDarkColor,
                borderRadius: BorderRadius.circular(25)),
            child: Center(
              child: Text(
                "$counter",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: ElevatedButton(
                onPressed: tesbeehCount,
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    backgroundColor: provi.mode==ThemeMode.light?primaryColor:yellowColor),
                child: Text(
                  tasbeehText[currentIndex],
                  style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: provi.mode==ThemeMode.light?Colors.white:Colors.black),
                )),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
