import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:tasheh/componant/cleanerPart/PartOfCleaner.dart';
import 'package:tasheh/componant/color/color.dart';

import '../data/details_dat.dart';

class Cleaner extends StatelessWidget {
  String nameOfJob;
  Cleaner({required this.nameOfJob,});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.black,
        appBar: PreferredSize(
          preferredSize: const Size(100, 100),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(color: MyColor.darkBlue),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: MyColor.white,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.8,
                  child: Text(
                    "الاوضاع الصحيحه لعمال النظافه",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: MyColor.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7)),
                  child: Image.asset(
                    "image/home/clen.jpeg",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    PartOfClean(nameOfJob: nameOfJob, index: 0),
                    SizedBox(height: 10),
                    PartOfClean(nameOfJob: nameOfJob, index: 1),
                    SizedBox(height: 10),
                    PartOfClean(nameOfJob: nameOfJob, index: 2),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
