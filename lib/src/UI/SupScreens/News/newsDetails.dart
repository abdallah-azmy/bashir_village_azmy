import 'dart:io';
import 'dart:typed_data';
import 'package:bashir_village/src/General%20Cubit/AddToFavCubit/add_toFav_cubit.dart';
import 'package:bashir_village/src/General%20Cubit/SeenCubit/seen_cubit.dart';
import 'package:bashir_village/src/UI/Basics/Register/Login/login.dart';
import 'package:bashir_village/src/UI/MainWidgets/customCircularLoading.dart';
import 'package:bashir_village/src/UI/MainWidgets/list_animator.dart';
import 'package:bashir_village/src/UI/SupScreens/Videos/Widgets/videosCard.dart';
import 'package:bashir_village/src/network/cachHelper.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:intl/intl.dart' as intl;
import 'package:url_launcher/url_launcher.dart';
import 'addComment.dart';
import 'newsPhotoGallary.dart';

class NewsDetails extends StatefulWidget {
  final String title;
  final List images;
  final List videos;
  final List videosLinks;
  final List phones;
  final List comments;
  final String content;
  final DateTime createAt;
  final int newsId;
  final int seen;

  const NewsDetails(
      {Key key,
      this.title,
      this.images,
      this.videos,
      this.videosLinks,
      this.phones,
      this.content,
      this.createAt,
      this.comments,
      this.newsId,
      this.seen})
      : super(key: key);

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  bool showPhotos = true;

  List<String> photos = [];
  // List<String> videos = [];

  _getShared() async {
    if (CacheHelper.getData(key: 'token') != null) {
      SeenCubit.get(context).seenFun(id: widget.newsId);
    }

    // Provider.of<SeenProvider>(context, listen: false)
    //     .getNewsSeen(_pref.get("token"), widget.newsId)
    //     .then((res) {});
  }

  String shareLink;

  Future<void> _createDynamicLink() async {
    print('id >>>>>>' + widget.newsId.toString());
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://bashirvillage.page.link',
      link: Uri.parse('https://bashirvillage.page.link?id=${widget.newsId}'),
      androidParameters: AndroidParameters(
        packageName: 'com.tqnee.bashir',
        minimumVersion: 0,
      ),
      dynamicLinkParametersOptions: DynamicLinkParametersOptions(
        shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
      ),
      iosParameters: IosParameters(
        bundleId: 'com.tqnee.bashir',
        minimumVersion: "4",
      ),
    );

    Uri url;
    final ShortDynamicLink shortLink = await parameters.buildShortLink();
    url = shortLink.shortUrl;
    setState(() {
      shareLink = url.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    _createDynamicLink();
    _getShared();
    for (int i = 0; i < widget.images.length; i++) {
      photos.add(widget.images[i].photo);
    }

    // for (int i = 0; i < widget.videos.length; i++) {
    //   videos.add(widget.videos[i].video);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل الخبر'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              String _msg;
              StringBuffer _sb = new StringBuffer();
              setState(() {
                _sb.write("${widget.title} \n");

                _sb.write(shareLink);
                // _sb.write("لتحميل تطبيق قرية البشير اضغط على الرابط التالي\n");
                // if (Platform.isAndroid) {
                //   _sb.write(
                //       "https://play.google.com/store/apps/details?id=com.tqnee.bashir_village");
                // } else if (Platform.isIOS) {
                //   _sb.write(
                //       "https://apps.apple.com/us/app/%D9%82%D8%B1%D9%8A%D8%A9-%D8%A8%D8%B4%D9%8A%D8%B1/id1463982460?ls=1");
                // }
                _msg = _sb.toString();
              });

              if (widget.images.length != 0) {
                var request = await HttpClient()
                    .getUrl(Uri.parse(widget.images[0].photo));
                var response = await request.close();
                Uint8List bytes =
                    await consolidateHttpClientResponseBytes(response);
                await Share.file('ESYS AMLOG', 'amlog.jpg', bytes, 'image/jpg',
                    text: _msg);
              } else {
                Share.text("title", _msg, 'text/plain');
              }
            },
            icon: Icon(Icons.share),
          ),
          BlocBuilder<AddToFavCubit, AddToFavState>(builder: (context, state) {
            return (state is AddToFavLoadingState)
                ? Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: CustomCircularLoading(),
                      ),
                    ],
                  )
                : IconButton(
                    onPressed: () {
                      _saveForm();
                    },
                    icon: Icon(Icons.favorite),
                  );
          })
        ],
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.comment),
            Text(
              "تعليقات",
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
        onPressed: () {
          if (CacheHelper.getData(key: 'token') == null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => LoginPage()));
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => AddComment(
                          comments: widget.comments,
                          newsId: widget.newsId,
                        )));
          }
        },
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    showPhotos = false;
                  });
                },
                child: Material(
                  borderRadius: BorderRadius.circular(8.0),
                  elevation: 5.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * .3,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: showPhotos == false
                            ? Colors.green[900]
                            : Colors.white),
                    child: Center(
                      child: Text(
                        "فيديو",
                        style: TextStyle(
                            color: showPhotos == false
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  setState(() {
                    showPhotos = true;
                  });
                },
                child: Material(
                  borderRadius: BorderRadius.circular(8.0),
                  elevation: 5.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * .3,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: showPhotos == true
                            ? Colors.green[900]
                            : Colors.white),
                    child: Center(
                      child: Text(
                        "صور",
                        style: TextStyle(
                            color: showPhotos == true
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          showPhotos == true ? _imageSlider() : _videoSlider(),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("${widget.comments.length}"),
                        SizedBox(width: 5),
                        Icon(
                          Icons.comment,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    SizedBox(width: 20),
                    Row(
                      children: <Widget>[
                        Text(widget.seen.toString()),
                        SizedBox(width: 5),
                        Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Text(
                    "${intl.DateFormat.d().format(widget.createAt)}/${intl.DateFormat.M().format(widget.createAt)}/${intl.DateFormat.y().format(widget.createAt)}",
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.right),
              ),
            ],
          ),
          SizedBox(height: 30),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.content,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          ListAnimator(
            physics: false,
            data: widget.videosLinks,
            child: (index) {
              return InkWell(
                onTap: () {
                  void _launchURL(url) async {
                    if (!await launch(url)) throw 'Could not launch $url';
                  }

                  _launchURL(widget.videosLinks[index].videoLink);
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.blue,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          "${widget.videosLinks[index].videoLink}",
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Divider(),
          ListAnimator(
            physics: false,
            data: widget.phones,
            child: (index) {
              return InkWell(
                onTap: () {
                  Future<void> _makePhoneCall(String phoneNumber) async {
                    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
                    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
                    // such as spaces in the input, which would cause `launch` to fail on some
                    // platforms.
                    final Uri launchUri = Uri(
                      scheme: 'tel',
                      path: phoneNumber,
                    );
                    await launch(launchUri.toString());
                  }

                  _makePhoneCall(widget.phones[index].phone);
                },
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.blue,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${widget.phones[index].name ?? ""}",
                            style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 26,
                          ),
                          // CircleAvatar(
                          //   radius: 5,
                          //   backgroundColor: Colors.blue,
                          // ),

                          Expanded(
                            child: Text(
                              "${widget.phones[index].phone}",
                              style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _imageSlider() {
    return Container(
      height: 300,
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsPhotoGallary(
                      content: widget.content,
                      images: photos,
                    ))),
        child: Carousel(
          boxFit: BoxFit.cover,
          images: List.generate(widget.images.length, (int index) {
            return NetworkImage(widget.images[index].photo.replaceAll("http", "https"));
          }),
          autoplay: false,
          dotSize: 4,
          dotSpacing:
              widget.images.length > 13 ? 300 / widget.images.length : 20,
          autoplayDuration: Duration(seconds: 1),
          dotBgColor: Colors.black26,
          animationCurve: Curves.decelerate,
          animationDuration: Duration(milliseconds: 1000),
          indicatorBgPadding: 10,
          dotColor: Colors.white,
        ),
      ),
    );
  }

//
  Widget _videoSlider() {
    return Container(
      height: 300,
      child: widget.videos.length == 0
          ? Center(
              child: Text("لا توجد فيديوهات"),
            )
          : Swiper(
              itemBuilder: (BuildContext context, int index) {
                return VideosCard(
                  // label: widget.videos[0].title,
                  video: widget.videos[index].video.replaceAll("http", "https"),
                  // video: "https://bashir.tqnee.com/uploads/news_videos/video_path_1641715802.mp4",
                );
              },
              itemCount: widget.videos.length,
              pagination: SwiperPagination(),
              control: SwiperControl(),
            ),
    );
  }

  ////Swiper(
  // //         autoplay: false,
  // //        itemCount: widget.videos.length,
  // //
  // //       ),
  //   Widget _videoSlider() {
  //     return Container(
  //       height: 300,
  //       child: Swiper(
  //         boxFit: BoxFit.cover,
  //         images: List.generate(widget.videos.length, (int index) {
  //           return VideosCard(
  //             // label: widget.videos[0].title,
  //             video: widget.videos[index].video,
  //           );
  //         }),
  //         autoplay: false,
  //
  //       ),
  //     );
  //   }

  _saveForm() {
    if (CacheHelper.getData(key: 'token') != null) {
      AddToFavCubit.get(context).addToFavFun(id: widget.newsId);
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (c) => LoginPage()));
    }
  }
}
