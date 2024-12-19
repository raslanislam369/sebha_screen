import 'package:flutter/material.dart';

import '../custom_color.dart';

class SebhaDetails extends StatefulWidget {
   SebhaDetails({super.key});

  @override
  State<SebhaDetails> createState() => _SebhaDetailsState();
}

class _SebhaDetailsState extends State<SebhaDetails> {
  String sabehOutBox="سَبِّحِ اسْمَ رَبِّكَ الأعلى ";

  String sabehInBox="سبحان الله";

  int counter=0;
  double turn=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.darkColor,
        body: Stack(
          children: [
            Image.asset(
              "assets/images/Sebha_BG.png",
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 200,
                ),
                Text(
                  textAlign: TextAlign.center,
                  sabehOutBox,
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: CustomColor.whiteColor),
                ),
                Stack(
                  children: [
                    InkWell(
                      onTap: (){
                        counter++;
                        counterView++;
                        turn+=(1/30);
                        sebha();
                        setState(() {

                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                          child: Column(
                            children: [
                              Image.asset("assets/images/Mask group.png",fit: BoxFit.contain,),
                              AnimatedRotation(

                                turns: turn,
                                duration: Duration(seconds: 1),
                                child: Image.asset(fit: BoxFit.fitHeight,
                                  "assets/images/sebhaBg1.png",
                                ),
                              ),
                            ],
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 225),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(sabehInBox,style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: CustomColor.whiteColor),),
                          SizedBox(height: 10,),
                          Text("$counterView",style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                              color: CustomColor.whiteColor))
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
  void sebha(){
      if(counter<33){
        sabehInBox="سبحان الله";
        sabehOutBox="سَبِّحِ اسْمَ رَبِّكَ الأعلى ";
        }
      else if(counter<66&&counter>=33){
        sabehInBox="الله اكبر";
        sabehOutBox="وَرَبَّكَ فَكَبِّرْ";
      }
      else if(counter<99&&counter>=66){
        sabehInBox="الحمد لله رب العالمين";
        sabehOutBox="وَقُلِ الْحَمْدُ لِلَّهِ الَّذِي لَمْ يَتَّخِذْ وَلَدًا";
      }
      else if(counter>=99){
        counter=0;
      }
      if(counterView==33){
        counterView=0;
      }
  }
  int counterView=0;
}
