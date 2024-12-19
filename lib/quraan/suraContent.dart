import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newflutterversion/custom_color.dart';

import '../model/class_model.dart';

class Suracontent extends StatefulWidget {
  static String routeName = "Content_page";

  Suracontent({super.key});

  @override
  State<Suracontent> createState() => _SuracontentState();
}

class _SuracontentState extends State<Suracontent> {
  List Verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Model;
    if (Verses.isEmpty) {
      viewSura(args.index);
    }
    return Scaffold(
      backgroundColor: CustomColor.darkColor,
      appBar: AppBar(
        backgroundColor: CustomColor.darkColor,
        title: Text(
          args.suraEng,
          style: TextStyle(color: CustomColor.primaryColor),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/contentBG.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
            color: CustomColor.primaryColor,
          ),
          Container(
            height: 615,
            child: Column(
              children: [
                SizedBox(height: 25,),
                Text(
                  "${args.suraArabic}",
                  style: TextStyle(
                      color: CustomColor.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                SizedBox(
                  height: 25,
                ),
                Expanded(
                    child: Verses.isEmpty
                        ? Center(
                            child: CircularProgressIndicator(
                            color: CustomColor.primaryColor,
                          ))
                        : ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return (Text(
                                textDirection: TextDirection.rtl,
                                "${Verses[index]} ${[index + 1]}",
                                style: TextStyle(
                                    color: CustomColor.primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ));
                            },
                            itemCount: Verses.length,
                          ))
              ],
            ),
          )
        ],
      ),
    );
  }

  void viewSura(int index) async {
    String suracont =
        await rootBundle.loadString("assets/files/Suras/${index + 1}.txt");
    List suraLines = suracont.split('\n');
    for (int i = 0; i < suraLines.length; i++) {
      Verses = suraLines;
    }
    setState(() {});
  }
}
