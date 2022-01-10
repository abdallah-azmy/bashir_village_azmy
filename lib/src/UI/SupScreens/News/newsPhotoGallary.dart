import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:photo_view/photo_view.dart';

class NewsPhotoGallary extends StatefulWidget {
  final List<String> images;
  final String content;

  const NewsPhotoGallary({Key key, this.images, this.content})
      : super(key: key);
  @override
  _NewsPhotoGallaryState createState() => _NewsPhotoGallaryState();
}

class _NewsPhotoGallaryState extends State<NewsPhotoGallary> {
  int _index = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("   "),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(widget.images.length == 0 ? "0" : _index.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 22)),
                        Text(' / ',
                            style: TextStyle(color: Colors.white, fontSize: 22)),
                        Text(widget.images.length.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 22)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              widget.images.length == 0
                  ? Container(
                      height: 600,
                      child: Center(
                        child: Text(
                          "لا توجد صور للعرض",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  : Flexible(
                    child: Container(
                        // height: 600,
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return PhotoView(

                              imageProvider:  NetworkImage(
                                widget.images.length == 0
                                    ? ""
                                    : widget.images[index],
                                  scale: 1.0
                              )
                              // CachedNetworkImage(
                              //   imageUrl: widget.images.length == 0
                              //       ? ""
                              //       : widget.images[index],
                              //   placeholder: (context, url) => new Center(
                              //     child: SpinKitThreeBounce(
                              //       size: 25,
                              //       color: Colors.white,
                              //     ),
                              //   ),
                              //   errorWidget: (context, url, error) =>
                              //       new Image.asset(
                              //     'assets/placeholder.png',
                              //     fit: BoxFit.contain,
                              //   ),
                              //   fit: BoxFit.contain,
                              // ),
                            );
                            // Image.network(widget.images[index].photo,
                            // fit: BoxFit.contain);
                          },
                          itemCount: widget.images.length,
                          onIndexChanged: (value) {
                            setState(() {
                              _index = value + 1;
                            });
                          },
                        ),
                      ),
                  ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, right: 10, left: 10),
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      widget.images.length == 0 ? "" : "",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
