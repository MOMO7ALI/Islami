import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/home/taps/ahadeth.dart';
import 'package:islami/home/taps/quran.dart';
import 'package:islami/home/taps/radio.dart';
import 'package:islami/home/taps/sebha.dart';
import 'package:islami/home/taps/setting.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';


class Home extends StatefulWidget {
  static const String routeName = 'Home';

  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(
         provider.mode==ThemeMode.light? "assets/images/main_bg.png":"assets/images/dark_bg.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
              elevation: 0,
              title: Text(
                "islami".tr(),style: Theme.of(context).textTheme.bodyLarge,
              )),
          body: tabs[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (value) {
              selectedIndex = value;
              setState(() {});
            },

            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/quran.png')),

                  label: "القرآن"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/sebha.png')),

                  label: "التسبيح"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/radio.png')),

                  label: "الراديو"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/ahadeth.png')),

                  label: "احاديث"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),

                  label: "الاعدادات "),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    SebhaTab(),
    RadioTab(),
    AhadethTab(),
    Setting(),
  ];
}
