import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/hadeth_details.dart';
import 'package:islami/hadeth_model.dart';

class AhadethTab extends StatefulWidget {
   AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel>allAhadeth=[];

  @override
  Widget build(BuildContext context) {
    if(allAhadeth.isEmpty) {
      loadHadethFile();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          "assets/images/hadeth_logo.png",
          height: 219,
        ),
        const Divider(
          thickness: 3,

        ),
        Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ahadeth".tr(),
                      style: GoogleFonts.elMessiri(
                          fontSize: 25, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 3,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context,index)=>const Divider(),
            itemBuilder:(context,index){
            return InkWell(
              onTap: (){
               Navigator.pushNamed(context,HadethDetails.routeName,
               arguments: allAhadeth[index]);
              },
              child: Text (
                textAlign: TextAlign.center,
                  allAhadeth[index].title,style: GoogleFonts.inter(
                  fontSize: 25, fontWeight: FontWeight.w400)),
            );
          },
            itemCount: allAhadeth.length,
          ),
        )
      ],
    );
  }

  loadHadethFile() {
    rootBundle.loadString("assets/files/ahadeth.txt").then((value) {
      List<String> ahadeth = value.split("#");
      for(int i=0;i<ahadeth.length;i++)
        {
          String hadethOne = ahadeth[i];
          List<String> hadethLines = hadethOne.trim().split("\n");
          String title = hadethLines[0];
          hadethLines.removeAt(0);
          List<String> content = hadethLines;
          HadethModel hadethModel=HadethModel(title, content);
          allAhadeth.add(hadethModel);
          print(hadethModel.title);

        }
      setState(() {

      });

    });
  }
}
