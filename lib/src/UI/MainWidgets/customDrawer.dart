import 'package:bashir_village/src/UI/Basics/Register/Login/login.dart';
import 'package:bashir_village/src/UI/Basics/Terms/aboutVillage.dart';
import 'package:bashir_village/src/UI/Basics/Terms/villageWelcome.dart';
import 'package:bashir_village/src/UI/MainScreens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  SharedPreferences _prefs;

  _getShared() async {
    final _instance = await SharedPreferences.getInstance();
    setState(() {
      _prefs = _instance;
    });
  }

  @override
  void initState() {
    super.initState();
    _getShared();
  }

  @override
  Widget build(BuildContext context) {
    return _prefs == null
        ? Center(
            child: SpinKitThreeBounce(
              size: 25,
              color: Theme.of(context).primaryColor,
            ),
          )
        : Drawer(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountEmail: null,
                    arrowColor: Colors.white,
                    accountName: Text(
                      "",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(color: Colors.white),
                    currentAccountPicture: Image.asset(
                      'assets/logo2.png',
                      width: 60,
                      height: 50,
                    ),
                  ),
                  ListTile(
                    title: Text('حسابي'),
                    onTap: () {
                      if (_prefs.get("token") == null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      } else {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctxt) => Profile(
                                      icon: Icon(Icons.arrow_back_ios),
                                    )));
                      }
                    },
                    trailing: Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                  ),
                  Divider(
                    height: 1,
                  ),
                  ListTile(
                    title: Text('حول قرية البشير'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AboutVillage()));
                    },
                    trailing: Icon(Icons.info, color: Colors.green),
                  ),
                  Divider(
                    height: 1,
                  ),
                  ListTile(
                    title: Text('ترحيب عريفة القرية'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => VillageWelcome()));
                    },
                    trailing: Icon(
                      Icons.info,
                      color: Colors.green,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 20),
                      child: InkWell(
                        onTap: _launchURL,
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'تصميم وتنفيذ تقني لتقنية المعلومات',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 12),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  _launchURL() async {
    const url = 'https://tqnee.com.sa';
    launch(url);
  }
}
