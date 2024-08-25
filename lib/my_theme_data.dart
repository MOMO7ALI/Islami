import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = Color(0xFFB7935F);
Color primaryDarkColor = Color(0xFF141A2E);
Color blackColor = Color(0xFF242424);
Color yellowColor = Color(0xFFFACC1D);

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    dividerTheme: DividerThemeData(color: primaryColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: primaryColor,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: blackColor,
        unselectedItemColor: Colors.white,
      ),
      primaryColor: primaryColor,

      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(

        iconTheme: IconThemeData(size: 30, color: blackColor),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),

      textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
          fontSize: 30,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: GoogleFonts.elMessiri(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
        bodySmall: GoogleFonts.elMessiri(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ));

  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryDarkColor,
      dividerTheme: DividerThemeData(color: yellowColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: primaryDarkColor,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: yellowColor,
        unselectedItemColor: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.white),
        iconTheme: IconThemeData(size: 30, color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),

      textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: GoogleFonts.elMessiri(
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        bodySmall: GoogleFonts.elMessiri(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      )
  );
}
