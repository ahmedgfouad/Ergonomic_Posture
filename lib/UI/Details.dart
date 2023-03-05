import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:tasheh/componant/color/color.dart';
import 'package:tasheh/data/details_dat.dart';
import 'package:video_player/video_player.dart';

class Details extends StatefulWidget {
  String nameOfJob;
  String title;
  String image;
  Details({required this.nameOfJob, required this.title,required this.image});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  VideoPlayerController? _videoPlayerController2;
  ChewieController? _chewieController2;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
      "${detailsData[widget.nameOfJob][0].video}",
    );
    _videoPlayerController2 = VideoPlayerController.network(
      "${detailsData[widget.nameOfJob][1].video}",
    );

    _videoPlayerController!.initialize().then((_) {
      _chewieController =
          ChewieController(videoPlayerController: _videoPlayerController!);
      setState(() {});
    });

    _videoPlayerController2!.initialize().then((_) {
      _chewieController2 =
          ChewieController(videoPlayerController: _videoPlayerController2!);
      setState(() {});
    });


  }

  @override
  void dispose() {
    _videoPlayerController!.dispose();
    _chewieController!.dispose();

    _videoPlayerController2!.dispose();
    _chewieController2!.dispose();

    super.dispose();
  }

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
                    "${widget.title}",
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
                    "${widget.image}",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    items: [
                      for (int i = 0;
                          i < detailsData[widget.nameOfJob].length;
                          i++)
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(
                            "${detailsData[widget.nameOfJob][i].image}",
                            fit: BoxFit.cover,
                          ),
                        ),
                    ],
                    options: CarouselOptions(

                      viewportFraction: .85,
                      autoPlayCurve: Curves.bounceIn,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  /// video
                  CarouselSlider(
                    items: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3,
                        decoration: BoxDecoration(
                            border: Border.all(width: .3, color: MyColor.blue)),
                        child: _chewieController != null &&
                            _videoPlayerController != null
                              ? Chewie(
                            controller: _chewieController!,
                          )
                              : SizedBox(
                                width: 200,
                                height: 200,
                                child:
                                Center(child: CircularProgressIndicator(),),
                        ),
                      ),
                      if (widget.nameOfJob == 'cary')
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                              border: Border.all(width: .3, color: MyColor.blue)),
                          child: _chewieController2 != null &&
                              _videoPlayerController2 != null
                              ? Chewie(
                            controller: _chewieController2!,
                          )
                              : SizedBox(
                                width: 200,
                                height: 200,
                                child:
                                Center(child: CircularProgressIndicator(),),
                          ),
                        ),
                    ],
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      viewportFraction: .85,
                      autoPlayCurve: Curves.bounceIn,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Discription",
                    style: TextStyle(
                      color: MyColor.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        // color: Colors.,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: MyColor.blue)),
                    child: ReadMoreText(
                      "${detailsData[widget.nameOfJob][0].description}",
                      trimLines: 5,
                      textAlign: TextAlign.start,
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
