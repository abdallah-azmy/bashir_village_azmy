import 'package:bashir_village/src/Helpers/consts.dart';
import 'package:bashir_village/src/app.dart';
import 'package:bashir_village/src/network/bloc_observer.dart';
import 'package:bashir_village/src/network/cachHelper.dart';
import 'package:bashir_village/src/network/firebaseNotifications.dart';
import 'package:bashir_village/src/provider/deviceTokenProvider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  await FirebaseMessaging.instance.getToken().then((value) {
    CacheHelper.saveData(key: 'fcmToken', value: value);
    DeviceTokenProvider().getToken(value);
  });
  // SharedPreferences.setMockInitialValues({});
  deviceToken = CacheHelper.getData(key: 'fcmToken');
  FirebaseNotifications().setUpFirebase();
  runApp(App());
}
