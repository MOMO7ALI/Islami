import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;
  Future<void>getTheme()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isdark=prefs.getBool('isdark');
    if(isdark!=null){
      if(isdark==true){
        mode= ThemeMode.dark;
      }
      else{
        mode =ThemeMode.light;
      }
      notifyListeners();

    }
  }

  Future<void>changeTheme(ThemeMode themeMode) async {
    mode = themeMode;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isdark', mode==ThemeMode.dark);
    notifyListeners();
  }
}
