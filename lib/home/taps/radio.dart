import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/my_theme_data.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
   var provider=Provider.of<MyProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:180),
            child: Image.asset(
              "assets/images/radio_image.png",
      height: 222,
            ),
          ),
          const SizedBox(height: 50,),
          Center(
            child: Text(
              "إذاعة القرآن الكريم ",
              style: GoogleFonts.elMessiri(
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
          ),
          const SizedBox(height: 50,),
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(

                icon: Icon(Icons.skip_previous, color: provider.mode==ThemeMode.light?primaryColor:yellowColor,size:40 ,),
                onPressed: () {
                  // Handle previous button press
                },
              ),
              IconButton(
                icon: Icon(Icons.play_arrow, color:  provider.mode==ThemeMode.light?primaryColor:yellowColor,size: 70),
                onPressed: () {
                  // Handle play button press
                },
              ),
              IconButton(
                icon: Icon(Icons.skip_next, color:  provider.mode==ThemeMode.light?primaryColor:yellowColor,size:40 ),
                onPressed: () {
                  // Handle next button press
                },
              ),
            ],
          ),


        ],
      ),
    );

  }
}
