// import 'package: /chewie.dart';
import 'package:bashir_village/src/UI/MainWidgets/customCircularLoading.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideosCard extends StatefulWidget {
  final String label;
  final String video;

  const VideosCard({Key key, this.label, this.video}) : super(key: key);

  @override
  _VideosCardState createState() => _VideosCardState();
}

class _VideosCardState extends State<VideosCard> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();


    _controller = VideoPlayerController.network(
        widget.video
    // "http://bashir.tqnee.com/uploads/news_videos/video_path_1641473261.MP4"
    // "http://bashir.tqnee.com/uploads/videos/video_path_1641715066.mp4"
    // "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4"
    )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }



  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: InkWell(
        onTap: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: <Widget>[
                Text(widget.label ?? "", textAlign: TextAlign.right),
                SizedBox(height: 10),
                Center(
                  child: widget.video == ""
                      ? Container(
                          height: 200,
                          child: Center(
                            child: Text("!لا يوجد فيديو"),
                          ),
                        )
                      : _controller.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            )
                          : Container(height: 200,child: Center(child: CustomCircularLoading())),
                ),
                SizedBox(height: 5)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
