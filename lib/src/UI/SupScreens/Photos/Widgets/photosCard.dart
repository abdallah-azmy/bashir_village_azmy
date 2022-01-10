import 'package:bashir_village/src/UI/SupScreens/Photos/photoGallery.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../models/photoGallaryModel.dart';

class PhotosCard extends StatefulWidget {
  final String label;
  final List<Photo> images;
  final String content;

  const PhotosCard({Key key, this.label, this.images, this.content})
      : super(key: key);

  @override
  _PhotosCardState createState() => _PhotosCardState();
}

class _PhotosCardState extends State<PhotosCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PhotoGallery(
                      content: widget.content,
                      images: widget.images,
                    ))),
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: <Widget>[
                Text(widget.label, textAlign: TextAlign.right),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text('...المزيد',
                          style: TextStyle(fontSize: 20, color: Colors.grey)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          CachedNetworkImage(
                            imageUrl: widget.images.length == 0
                                ? ""
                                : widget.images[0].photo,
                            placeholder: (context, url) => new Center(
                              child: SpinKitThreeBounce(
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                new Image.asset(
                              'assets/placeholder.png',
                              fit: BoxFit.fill,
                              width: 100,
                              height: 100,
                            ),
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(width: 10),
                          CachedNetworkImage(
                            imageUrl: widget.images.length == 1 ||
                                    widget.images.length == 0
                                ? ""
                                : widget.images[1].photo,
                            placeholder: (context, url) => new Center(
                              child: SpinKitThreeBounce(
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                new Image.asset(
                              'assets/placeholder.png',
                              fit: BoxFit.fill,
                              width: 100,
                              height: 100,
                            ),
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
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
