import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../data/details_dat.dart';
import '../color/color.dart';

class PartOfClean extends StatelessWidget {
  String nameOfJob;
  int index ;
  PartOfClean({required this.nameOfJob,required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(
              color: MyColor.white,
              width: .3
          )
      ),
      child: Column(
        children: [
          CarouselSlider(
            items: [
              Image.asset(
                "${detailsData[nameOfJob][index].image}",
                height: MediaQuery.of(context).size.height/3.4,
              ),
              if(index==2)
                Image.asset("image/clean/4.jpeg"),
            ],
            options: CarouselOptions(
              enableInfiniteScroll: false,
              viewportFraction: .8,
              autoPlayCurve: Curves.bounceIn,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "  Discription",
                style: TextStyle(
                  color: MyColor.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: .8, color: MyColor.blue)),
            child: ReadMoreText(
              "${detailsData[nameOfJob][index].description}",
              trimLines: 2,
              textAlign: TextAlign.end,
              style: TextStyle(color: MyColor.white),
              trimMode: TrimMode.Line,
              trimCollapsedText: '     See more',
              trimExpandedText: '''
                      See less
                      ''',
              lessStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: MyColor.blue,
              ),
              moreStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: MyColor.blue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
