import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/hadeth_model.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

import 'my_theme_data.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = 'hadethScreen';

  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var provd= Provider.of<MyProvider>(context);
    var model = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(provd.mode==ThemeMode.light?'assets/images/main_bg.png':'assets/images/dark_bg.png'))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            model.title,
            style: Theme.of(context).textTheme.bodyMedium,

          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Card(
            color: provd.mode==ThemeMode.light?primaryColor:primaryDarkColor,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(
                    textDirection: TextDirection.rtl,
                    model.content[index],
                    style: GoogleFonts.elMessiri(
                        fontSize: 20, fontWeight: FontWeight.w400,

                    color: provd.mode==ThemeMode.light?Colors.black:yellowColor
                    ),


                );
              },
              itemCount: model.content.length,
            ),
          ),
        ),
      ),
    );
  }
}
