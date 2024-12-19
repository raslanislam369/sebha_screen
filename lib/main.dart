import 'package:flutter/material.dart';
import 'package:newflutterversion/custom_theme.dart';
import 'package:newflutterversion/home_screen.dart';
import 'package:newflutterversion/quraan/quraan_details.dart';
import 'package:newflutterversion/splash_screen.dart';

import 'quraan/suraContent.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
        Suracontent.routeName:(context)=>Suracontent(),
      },
      darkTheme: CustomTheme.customTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
