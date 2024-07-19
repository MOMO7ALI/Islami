import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/home/taps/ahadeth.dart';
import 'package:islami/home/taps/quran.dart';
import 'package:islami/home/taps/radio.dart';
import 'package:islami/home/taps/sebha.dart';
import 'package:islami/home/taps/setting.dart';

class Home extends StatefulWidget {
  static const String routeName = 'Home';

 Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
int selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/main_bg.png"),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                'إسلامي ',
                style: GoogleFonts.elMessiri(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              )),
          body: tabs[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (value){
              selectedIndex=value;
              setState(() {

              });

            },
            backgroundColor: Color(0xFFB7935F),
            type: BottomNavigationBarType.shifting,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
            showUnselectedLabels: false,
            showSelectedLabels: true,
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/quran.png')),backgroundColor: Color(0xFFB7935F),
                  label: "القرآن"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/sebha.png')),backgroundColor: Color(0xFFB7935F),
                  label: "التسبيح"),

              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/radio.png')),backgroundColor: Color(0xFFB7935F),
                  label: "الراديو"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/ahadeth.png')),backgroundColor: Color(0xFFB7935F),
                  label: "احاديث"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings
                  ),backgroundColor: Color(0xFFB7935F),
                  label: "الاعدادات "),

            ],
          ),
        ),
      ],
    );
  }
  List<Widget> tabs=[
    QuranTab(),
    SebhaTab(),
    RadioTab(),
    AhadethTab(),
    Setting(),

  ];
}

