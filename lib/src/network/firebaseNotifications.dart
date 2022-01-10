import 'dart:async';
import 'dart:io';

import 'package:bashir_village/main.dart';
import 'package:bashir_village/src/UI/Intro/splash.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call initializeApp before using other Firebase services.
  // await Firebase.initializeApp();

  print("Handling a background message: ${message.data}");

  // NewNotificationCubit.get(navigator.currentContext)
  //     .getNewNotifications(context: navigator.currentContext);
}

class FirebaseNotifications {
  FirebaseMessaging _firebaseMessaging;

  Map<String, dynamic> _not;

  Future<void> setUpFirebase() async {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    _firebaseMessaging = FirebaseMessaging.instance;
    _firebaseMessaging.setAutoInitEnabled(true);
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);
    checkLastMessage();
    firebaseCloudMessagingListeners();
  }

  Future<void> checkLastMessage() async {
    RemoteMessage initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      print(initialMessage.data.toString());
      handlePath(initialMessage.data);
    }
  }

  Future<void> firebaseCloudMessagingListeners() async {
    if (Platform.isIOS) iOSPermission();

//    _firebaseMessaging.getToken().then((token) {
//      print("TOOOKEN" + token);
//    });

    FirebaseMessaging.onMessage.listen((RemoteMessage data) {
      print('on message ${data.data}');
      print('on message notification body : ${data.notification.body}');
      print('on message notification title : ${data.notification.title}');

      // NewNotificationCubit.get(navigator.currentContext)
      //     .getNewNotifications(context: navigator.currentContext);
      // showToast(
      //     msg: localization.text("New Notification !"),
      //     state: ToastStates.WARNING);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage data) {
      print('on Opened ' + data.data.toString());

      // NewNotificationCubit.get(navigator.currentContext)
      //     .getNewNotifications(context: navigator.currentContext);
      handlePath(data.data);
    });
  }

  void iOSPermission() {
    _firebaseMessaging.requestPermission(
        alert: true, announcement: true, badge: true, sound: true);
  }

  void handlePath(Map<String, dynamic> dataMap) {
    handlePathByRoute(dataMap);
  }

  Future<void> handlePathByRoute(Map<String, dynamic> dataMap) async {
    String type = dataMap["key"].toString();
    print("type $type");
    Navigator.push(
        navigator.currentContext, MaterialPageRoute(builder: (c) => SplashScreen()));
  }

  Future<void> onSelectNotification(String payload) async {
    print(payload.toString());
    handlePath(_not);
  }
}

// class FirebaseNotifications {
//   FirebaseMessaging _firebaseMessaging;
//   GlobalKey<NavigatorState> navigatorKey;
// //  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//
//   void setUpFirebase(GlobalKey<NavigatorState> navigatorKey) {
//     this.navigatorKey = navigatorKey;
//     _firebaseMessaging = FirebaseMessaging.instance;
//     firebaseCloudMessaging_Listeners();
//   }
//
//   // ignore: non_constant_identifier_names
//   void firebaseCloudMessaging_Listeners() {
//     if (Platform.isIOS) iOS_Permission();
//
//     _firebaseMessaging.getToken().then((token) {
//       print("FCM token >>>>>>> " + token);
//     });
//     _firebaseMessaging.configure(
//       onMessage: (Map<String, dynamic> message) async {
//         print('on message ' + message['data'].toString());
//         _onMessageStreamController.add(message);
//         // FlutterRingtonePlayer.playNotification(
//         //   volume: 50,
//         //   asAlarm: true,
//         // );
//       },
//       onResume: (Map<String, dynamic> message) async {
//         print('on resume $message');
// //        navigatorKey.currentState.pushNamed("screen");
//         handlePath(message);
//         // FlutterRingtonePlayer.playNotification(
//         //   volume: 50,
//         //   asAlarm: true,
//         // );
//       },
//       onLaunch: (Map<String, dynamic> message) async {
//         print('on launch $message');
//         // FlutterRingtonePlayer.playNotification(
//         //   volume: 50,
//         //   asAlarm: true,
//         // );
//         handlePath(message);
//       },
//     );
//   }
//
// //  void setUpLocal() {
// //    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
// //// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
// //    var initializationSettingsAndroid =
// //        new AndroidInitializationSettings('app_icon');
// //    var initializationSettingsIOS = new IOSInitializationSettings(
// //        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
// //    var initializationSettings = new InitializationSettings(
// //        initializationSettingsAndroid, initializationSettingsIOS);
// //    flutterLocalNotificationsPlugin.initialize(initializationSettings,
// //        onSelectNotification: onSelectNotification);
// //  }
//
//   // ignore: non_constant_identifier_names
//   void iOS_Permission() {
//     _firebaseMessaging.requestNotificationPermissions(
//         IosNotificationSettings(sound: true, badge: true, alert: true));
//     _firebaseMessaging.onIosSettingsRegistered
//         .listen((IosNotificationSettings settings) {
//       print("Settings registered: $settings");
//     });
//   }
//
//   void handlePath(Map<String, dynamic> dataMap) {
//     handlePathByRoute(dataMap);
//   }
//
//   void handlePathByRoute(Map<String, dynamic> dataMap) {
// //    String path = dataMap['data']["route"].toString();
// //    var id = dataMap['data']["id"];
// //    var name = dataMap['data']["name"];
// //    int counter = int.parse(dataMap['data']["counter"]);
// //    switch (path) {
// //      case "user":
// //        print("truee");
// //
// //        break;
// //      default:
// //        print("falsse");
// //    }
//
//     navigatorKey.currentState
//         .push(MaterialPageRoute(builder: (context) => SplashScreen()));
//   }
//
//   Future onDidReceiveLocalNotification(
//       int id, String title, String body, String payload) async {
//     if (payload != null) {
//       debugPrint('notification payload: ' + payload);
//     }
//   }
//
//   // ignore: missing_return
//   Future onSelectNotification(String payload) {}
//
//   static StreamController<Map<String, dynamic>> _onMessageStreamController =
//   StreamController.broadcast();
//
//   StreamController<Map<String, dynamic>> get notificationSubject {
//     return _onMessageStreamController;
//   }
//
// //  void pushNotification() async {
// //    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
// //        'your channel id', 'your channel name', 'your channel description',
// //        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
// //    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
// //    var platformChannelSpecifics = NotificationDetails(
// //        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
// //    await flutterLocalNotificationsPlugin.show(
// //        0, 'plain title', 'plain body', platformChannelSpecifics,
// //        payload: 'item x');
// //  }
//
//   void killNotification() {
//     _onMessageStreamController.close();
//   }
// }