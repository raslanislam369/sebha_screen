import 'package:flutter/material.dart';
import 'package:newflutterversion/custom_color.dart';
import 'package:newflutterversion/hadeth/hadeth_details.dart';
import 'package:newflutterversion/quraan/quraan_details.dart';
import 'package:newflutterversion/radio/radio_details.dart';
import 'package:newflutterversion/sebha/sebha_details.dart';
import 'package:newflutterversion/time/time_details.dart';

class HomeScreen extends StatefulWidget {
  static String routeName="Home_page";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int intialIndex = 0;
  List<Image> bG=[
    Image.asset("assets/images/Background.png",
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,),
    Image.asset("assets/images/hadeth_bg.png",
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,),
    Image.asset("assets/images/sebha.png",
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,),
    Image.asset("assets/images/radio_bg.png",
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,),
    Image.asset("assets/images/time_bg.png",
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,),
  ];
  List<Widget> pgDetails=[
    QuraanDetails(),
    HadethDetails(),
    SebhaDetails(),
    RadioDetails(),
    TimeDetails()
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        bG[intialIndex]
        ,
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: CustomColor.whiteColor,
              unselectedItemColor: CustomColor.darkColor,
              showUnselectedLabels: false,
              showSelectedLabels: true,
              onTap: (index) {
                intialIndex = index;
                setState(() {});
              },
              currentIndex: intialIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: CustomColor.primaryColor,
              items: [
                BottomNavigationBarItem(
                    icon: backIcon(0, "quraan"),
                    label: "Quran"),
                BottomNavigationBarItem(
                    icon: backIcon(1, "hadeth"),
                    label: "Hadeth"),
                BottomNavigationBarItem(
                    icon: backIcon(2, "sebha"),
                    label: "Sebha"),
                BottomNavigationBarItem(
                    icon: backIcon(3, "radio"),
                    label: "Radio"),
                BottomNavigationBarItem(
                    icon: backIcon(4, "time"),
                    label: "Time"),
              ]),
          body: pgDetails[intialIndex],
        )
      ],
    );
  }

  Widget backIcon(int i,String image) {
    return i == intialIndex
        ? Container(
        width: 59,
        height: 34,
        decoration: BoxDecoration(color: Color(0x61202020),
            borderRadius: BorderRadius.all(Radius.circular(66))),
        child: ImageIcon(AssetImage("assets/images/$image.png")))
        : ImageIcon(AssetImage("assets/images/$image.png"));
  }
}
