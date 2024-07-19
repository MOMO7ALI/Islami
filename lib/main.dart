import 'package:flutter/material.dart';
import 'package:islami/sura_details.dart';

import 'home.dart';

void main(){
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:  Home.routeName,
      routes: {
        Home.routeName:(context)=>Home(),
        SuraDetails.routeName:(context)=>SuraDetails(),

      },
    );
  }
}
