import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasheh/componant/color/color.dart';

class NameOfWork extends StatelessWidget {
  String nameOfJob;
  String image;
  String description;

  NameOfWork({
    required this.nameOfJob,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 90,
            decoration: BoxDecoration(
              border: Border.all(
                color: MyColor.blue,
                width: 2,
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(70),
                bottomRight: Radius.circular(70),
              ),
              color: MyColor.black,
            ),
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2.5 ,
                child: Text(
                  nameOfJob,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyColor.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 52,
                  backgroundColor: MyColor.blue,
                  child: Container(
                    width: 100,
                    height: 100,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: MyColor.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
