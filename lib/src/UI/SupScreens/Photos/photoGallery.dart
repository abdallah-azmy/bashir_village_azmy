import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:photo_view/photo_view.dart';

import '../../../models/photoGallaryModel.dart';

class PhotoGallery extends StatefulWidget {
  final List<Photo> images;
  final String content;

  const PhotoGallery({Key key, this.images, this.content}) : super(key: key);
  @override
  _PhotoGalleryState createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  int _index = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Text(_index.toString(),
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
                        // height: MediaQuery.of(context).size.height/2,
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return PhotoView(
                                imageProvider:
                                NetworkImage(
                                   widget.images.length == 0
                                        ? ""
                                        : widget.images[index].photo,
                                    scale: 1.0
                                )

                            );

                            //   CachedNetworkImage(
                            //   imageUrl: widget.images.length == 0
                            //       ? ""
                            //       : widget.images[index].photo,
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
                            // );
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
                    const EdgeInsets.only(bottom: 40.0, right: 10, left: 10),
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      widget.images.length == 0
                          ? ""
                          : widget.images[_index - 1].title,
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
