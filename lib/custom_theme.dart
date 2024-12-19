import 'package:flutter/material.dart';
import 'package:newflutterversion/custom_color.dart';

class CustomTheme {

  static final ThemeData customTheme=ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(color: CustomColor.primaryColor),
      color: CustomColor.primaryColor
    )
  );

}