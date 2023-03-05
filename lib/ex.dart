import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:tasheh/data/details_dat.dart';
import 'package:video_player/video_player.dart';

class Ex extends StatefulWidget {
  const Ex({Key? key}) : super(key: key);

  @override
  State<Ex> createState() => _ExState();
}

class _ExState extends State<Ex> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  VideoPlayerController? _videoPlayerController2;
  ChewieController? _chewieController2;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
      "https://drive.google.com/uc?export=view&id=1vIxa1C8GzFA_3SpyplStKka7PXkA5j3X",
    );
    _videoPlayerController2 = VideoPlayerController.network(
      "https://drive.google.com/uc?export=view&id=1NUFYDXAVAsN5pPGrwjV7enWfDSxWBbrZ",
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
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(60),
                      bottomLeft: Radius.circular(60),
                    )),
                child: Image.asset("image/home/back.jpeg", fit: BoxFit.cover),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.separated(
                    itemCount: 20,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),

                  )),
            ],
          ),
        ));
  }
}
