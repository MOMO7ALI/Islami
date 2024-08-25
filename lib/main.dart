import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/hadeth_details.dart';
import 'package:islami/my_theme_data.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:islami/sura_details.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'home.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (context) => MyProvider()..getTheme(),
      child: EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('ar')],
          path: 'assets/translations', // <-- change the path of the translation files


          child: const MyApp())));

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<MyProvider>(context)..getTheme();

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context,child)=>ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
        ],
      ),
      debugShowCheckedModeBanner: false,
      themeMode: provider.mode,
      theme:MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      initialRoute:  Home.routeName,
      routes: {
        Home.routeName:(context)=>Home(),
        SuraDetails.routeName:(context)=>const SuraDetails(),
        HadethDetails.routeName:(context)=>const HadethDetails(),

      },
    );
  }
}
