import 'dart:io';
import 'dart:typed_data';

import 'package:bashir_village/src/UI/Basics/Register/Login/login.dart';
import 'package:bashir_village/src/UI/SupScreens/News/addComment.dart';
import 'package:bashir_village/src/UI/SupScreens/News/newsPhotoGallary.dart';
import 'package:bashir_village/src/models/getNewsById.dart';
import 'package:bashir_village/src/provider/addToFavProvider.dart';
import 'package:bashir_village/src/provider/getNewsByIdProvider.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationDetails extends StatefulWidget {
  final int id;

  const NotificationDetails({Key key, this.id}) : super(key: key);

  @override
  _NotificationDetailsState createState() => _NotificationDetailsState();
}

class _NotificationDetailsState extends State<NotificationDetails> {
  GetNewsIdModel _model;
  String token;
  SharedPreferences _pref;
  List<String> photos = [];
  _getShared() async {
    final _instance = await SharedPreferences.getInstance();
    setState(() {
      _pref = _instance;
    });
    Provider.of<GetNewsByIdProvider>(context, listen: false)
        .getNewsById(widget.id)
        .then((res) {
      setState(() {
        _model = res;
      });
      for (int i = 0; i < _model.data[0].photos.length; i++) {
        photos.add(_model.data[0].photos[i].photo);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _createDynamicLink();
    _getShared();
  }

  String shareLink;
  Future<void> _createDynamicLink() async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://bashirvillage.page.link',
      link: Uri.parse('https://bashir_village.page.link?id=${widget.id}'),
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
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () async {
                  String _msg;
                  StringBuffer _sb = new StringBuffer();
                  setState(() {
                    _sb.write("عنوان الخبر : ${_model.data[0].title} \n");
                    // _sb.write(
                    //     "تخصص: \n");
                    // _sb.write(
                    //     "ونوع سيارة: \n");
                    // _sb.write(
                    //     "الموجودة في: n");
                    _sb.write(shareLink);
                    // _sb.write("لتحميل تطبيق قرية البشير اضغط على الرابط\n");
                    // _sb.write(
                    //     "https://www.google.com/maps/search/?api=1&query=");
                    _msg = _sb.toString();
                  });

                  if (_model.data[0].photos.length != 0) {
                    var request = await HttpClient()
                        .getUrl(Uri.parse(_model.data[0].photos[0].photo));
                    var response = await request.close();
                    Uint8List bytes =
                        await consolidateHttpClientResponseBytes(response);
                    await Share.file(
                        'ESYS AMLOG', 'amlog.jpg', bytes, 'image/jpg',
                        text: _msg);
                  } else {
                    Share.text("title", _msg, 'text/plain');
                  }
                },
                icon: Icon(Icons.share),
              )),
          IconButton(
            onPressed: () {
              _saveForm();
            },
            icon: Icon(Icons.favorite),
          ),
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
          if (_pref.get("token") == null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctxt) => LoginPage()));
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => AddComment(
                          comments: _model.data[0].comments,
                          newsId: _model.data[0].id,
                        )));
          }
        },
      ),
      body: _model == null
          ? Center(
              child: SpinKitThreeBounce(
                size: 25,
                color: Theme.of(context).primaryColor,
              ),
            )
          : ListView(
              children: <Widget>[
                SizedBox(height: 20),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Text(
                        _model.data[0].title,
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                _imageSlider(),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("${_model.data[0].comments.length}"),
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
                              Text(_model.data[0].seen.toString()),
                              SizedBox(width: 5),
                              Icon(
                                Icons.remove_red_eye,
                                color: Colors.grey,
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Text(
                            "${intl.DateFormat.d().format(_model.data[0].createdAt)}/${intl.DateFormat.M().format(_model.data[0].createdAt)}/${intl.DateFormat.y().format(_model.data[0].createdAt)}",
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.right),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _model.data[0].content,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
    );
  }

  Widget _imageSlider() {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewsPhotoGallary(
                    content: _model.data[0].content,
                    images: photos,
                  ))),
      child: Container(
        height: 300,
        child: Carousel(
          boxFit: BoxFit.cover,
          images: List.generate(_model.data[0].photos.length, (int index) {
            return NetworkImage(_model.data[0].photos[index].photo);
          }),
          autoplay: false,
          dotSize: 4,
          dotSpacing:
             _model.data[0].photos.length > 13 ? 300 / _model.data[0].photos.length : 20,
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

  _saveForm() {
    Provider.of<AddToFavProvider>(context, listen: false)
        .addToFav(_pref.get("token"), widget.id)
        .then((res) {
      switch (res.code) {
        case 200:
          print("done");
          setState(() {
            //    _model = null;
          });
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.white,
                  elevation: 3,
                  contentPadding: EdgeInsets.all(5),
                  children: <Widget>[
                    Text(
                      res.data,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        elevation: 3,
                        height: 45,
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          'موافق',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                );
              });

          break;

        default:
          setState(() {
            //_load = false;
          });
          print('error data');
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.white,
                  elevation: 3,
                  contentPadding: EdgeInsets.all(5),
                  children: <Widget>[
                    Text(
                      res.error[0].value,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        elevation: 3,
                        height: 45,
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          'موافق',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                );
              });
      }
    });
  }
}
