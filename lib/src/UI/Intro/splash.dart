import 'dart:async';
import 'dart:io';

import 'package:bashir_village/src/UI/MainWidgets/customDialog.dart';
import 'package:bashir_village/src/UI/mainPage.dart';
import 'package:bashir_village/src/network/cachHelper.dart';
import 'package:bashir_village/src/network/firebaseNotifications.dart';
import 'package:bashir_village/src/provider/deviceTokenProvider.dart';
import 'package:bashir_village/src/provider/getFavProvider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  final GlobalKey<NavigatorState> navigator;

  SplashScreen({Key key, this.navigator}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  CustomDialog _dialog = CustomDialog();

  _sendToken() async {
    if(CacheHelper.getUserData() != null){
      _checkToken(CacheHelper.getUserData().data[0].apiToken);
    }

  }

  _checkToken(String token) {
    Provider.of<GetFavProvider>(context, listen: false)
        .getFav(token)
        .then((res) {
      if (res.code == 401) {
        print('----- clear ----');
        CacheHelper.removeData(key: "token");
        CacheHelper.removeData(key: "userData");
      }
    });
  }

  _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      print('not connected');
      _dialog.showWarningDialog(
          context: context,
          msg: 'من فضلك تأكد من توفر إتصال بالإنترنت',
          btnOnPress: () {});
    }
  }

  @override
  void initState() {
    super.initState();
    // FirebaseNotifications().setUpFirebase();
    _loadData();
    _checkInternetConnection();
    // _getShared();
    _sendToken();
  }

  Future<Timer> _loadData() async {
    return new Timer(
        Duration(seconds: 3),
        () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => MainPage(),
              ),
              (Route<dynamic> route) => false,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/splash.png',
      fit: BoxFit.cover,
    );
  }
}
