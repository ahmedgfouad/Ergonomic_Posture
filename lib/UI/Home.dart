import 'package:flutter/material.dart';
import 'package:tasheh/UI/Details.dart';
import 'package:tasheh/UI/clean.dart';
import 'package:tasheh/componant/color/color.dart';
import 'package:tasheh/componant/nameOfWork/NameOfWork.dart';
import 'package:tasheh/data/home_data.dart';

import '../data/details_dat.dart';

class Home extends StatelessWidget {
  List nameOfJob = ['computer','cary','clean','driver','dentist'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.black,
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(60),
                      bottomLeft: Radius.circular(60),
                    )
                  ),
                  child: Image.asset("image/home/back.jpeg",fit: BoxFit.cover),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/.8,
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder:(context,index)=>SizedBox(height: 10,) ,
                    itemCount: 5,
                    itemBuilder:(context,index)=>InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context){
                            if (index==2)
                              return Cleaner(
                                nameOfJob: 'clean',
                              );
                            else
                             return Details(
                               nameOfJob: nameOfJob[index],
                               title: "${homeData[index].nameOfJob}",
                               image: "${homeData[index].image}",
                             );
                          }),
                        );
                        print("${homeData[index].nameOfJob}");
                      },
                      child: NameOfWork(
                          nameOfJob: "${homeData[index].nameOfJob}",
                          image: homeData[index].image,
                          description: "${homeData[index].description}",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
