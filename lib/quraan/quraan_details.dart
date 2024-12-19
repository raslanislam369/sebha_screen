import 'package:flutter/material.dart';
import 'package:newflutterversion/custom_color.dart';
import 'package:newflutterversion/model/class_model.dart';
import 'package:newflutterversion/quraan/suraContent.dart';

class QuraanDetails extends StatelessWidget {
   QuraanDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Image.asset(
              "assets/images/Logo.png",
            ),
            height: 170,
            width: 290,
          ),
          TextField(
            style: TextStyle(
                color: CustomColor.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
            cursorColor: CustomColor.whiteColor,
            decoration: InputDecoration(
                prefixIcon: ImageIcon(
                  AssetImage(
                    "assets/images/search_icon.png",
                  ),
                  color: CustomColor.primaryColor,
                ),
                hintText: "Sura Name",
                focusColor: CustomColor.primaryColor,
                hintStyle: TextStyle(color: CustomColor.whiteColor),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: CustomColor.primaryColor, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: CustomColor.primaryColor, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(12)))),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Most Recently ",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: CustomColor.whiteColor),
          ),
          SizedBox(
            height: 15,
          ),
          Stack(
            children: [
              Container(
                width: 283,
                height: 150,
                decoration: BoxDecoration(
                    color: CustomColor.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              Row(children: [
                SizedBox(width: 10,),
                Column(children: [
                  Text("Al-Anbiya",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
                  Text("الأنبياء",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
                  Text("112 Verses  ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),)
              ],),SizedBox(width: 15,),Image.asset("assets/images/quraan_surah.png",)],)
            ],
          ),
          SizedBox(height: 10,),
          Text("Suras List",style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: CustomColor.whiteColor),),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.separated(padding: EdgeInsets.all(0),itemCount: Model.englishQuranSuras.length,itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Navigator.pushNamed(context, Suracontent.routeName,arguments: Model.getSuraDetails(index));
                },
                child: Row(children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset("assets/images/surah_number.png"),
                      Text("${index+1}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: CustomColor.whiteColor),),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Model.englishQuranSuras[index],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: CustomColor.whiteColor),),
                        Text("${Model.AyaNumber[index]} Verses",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: CustomColor.whiteColor),),
                      ],
                    ),
                  ),
                  Text(Model.arabicQuranSuras[index],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: CustomColor.whiteColor),),
                ],mainAxisAlignment: MainAxisAlignment.spaceBetween,),
              );
            
            }, separatorBuilder: (BuildContext context, int index) {
              return Divider(thickness: 2,color: CustomColor.whiteColor,indent: 40,endIndent: 40,);
            },),
          )
        ],
      ),
    );
  }
}
