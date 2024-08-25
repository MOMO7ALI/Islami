import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:islami/sura_model.dart';
import 'package:provider/provider.dart';

import 'my_theme_data.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'Sura';

  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provid = Provider.of<MyProvider>(context);
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(model.index);
    }
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provid.mode == ThemeMode.light
                  ? "assets/images/main_bg.png"
                  : 'assets/images/dark_bg.png'))),
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: Text(
              model.name,
              style: Theme.of(context).textTheme.bodyMedium,
            )),
        body: Card(
          color:
              provid.mode == ThemeMode.light ? primaryColor : primaryDarkColor,
          elevation: 4,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.transparent)),
          margin: EdgeInsets.all(12),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Stack(
                  alignment:Alignment.center,
                children: [
                Text(
                  verses[index],
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.amiriQuran(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: provid.mode == ThemeMode.light
                          ? Colors.black
                          : yellowColor),
                ),
              ]);
            },
            itemCount: verses.length,
          ),
        ),
      ),
    );
  }

  loadSuraFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> suraLines = sura.split("\n");
    verses = suraLines;
    setState(() {});
  }
}
