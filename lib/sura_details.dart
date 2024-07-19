import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/sura_model.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName='Sura';
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String>verses=[];
  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel ;
   if(verses.isEmpty){
     loadSuraFile(model.index);

   }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/main_bg.png"))
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              model.name,
              style: GoogleFonts.elMessiri(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            )),
        body: Card(
          color: Color(0xFFFFFFFF),
          elevation: 4,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Colors.transparent
            )

          ),
          margin: EdgeInsets.all(12),
          child: ListView.builder(itemBuilder: (context,index){
            return Stack(
              children: [
               Text(verses[index],
                  textDirection:TextDirection.rtl,
                  textAlign: TextAlign.center,style: GoogleFonts.inter(
                fontSize: 20,
                  fontWeight:FontWeight.w400,
                  color: Colors.black


              ),),
            ]
            );
          },
          itemCount: verses.length,
          ),
        ),


      ),
    );
  }

  loadSuraFile(int index) async{
    String sura= await  rootBundle.loadString("assets/files/${index+1}.txt");
    List<String>suraLines=sura.split("\n");
    verses=suraLines;
    setState(() {

    });

  }
}
