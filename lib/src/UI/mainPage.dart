import 'package:bashir_village/src/UI/MainScreens/callUs.dart';
import 'package:bashir_village/src/UI/Notifications/notificationDetails.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

import 'MainScreens/HomePage/homePage.dart';
import 'MainScreens/profile/profile.dart';

class MainPage extends StatefulWidget {
  final int index;

  const MainPage({Key key, this.index}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1;

  List<Widget> _widgetOptions = <Widget>[
    CallUs(),
    HomePage(),
    Profile(),
  ];
  String newsId;

  void fetchLinkData() async {
    var link = await FirebaseDynamicLinks.instance.getInitialLink();
    handleLinkData(link);
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      handleLinkData(dynamicLink);
    });
  }

  void handleLinkData(PendingDynamicLinkData data) {
    final Uri uri = data?.link;
    if (uri != null) {
      print(' >>>>>>> ' + uri.path);
      final queryParams = uri.queryParameters;
      print(' >>>>>>> ' + queryParams.toString());
      if (queryParams.length > 0) {
        String id = queryParams["id"];
        print("My users id is: $id");
        setState(() {
          newsId = id;
        });
        initDynamicLinks();
      }
    }
  }

  void initDynamicLinks() async {
    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (c) => NotificationDetails(
                    id: int.parse(newsId),
                  )));
    }

    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      final Uri deepLink = dynamicLink?.link;

      if (deepLink != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (c) => NotificationDetails(
                      id: int.parse(newsId),
                    )));
      }
    }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchLinkData();
    if (widget.index != null) {
      _selectedIndex = widget.index;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom:20.0),
          child: TitledBottomNavigationBar(
              indicatorColor: Theme.of(context).primaryColor,
              inactiveColor: Colors.black,
              activeColor: Theme.of(context).primaryColor,
              items: [
                TitledNavigationBarItem(title: 'راسلنا', icon: Icons.message),
                TitledNavigationBarItem(title: 'الرئيسية', icon: Icons.home),
                TitledNavigationBarItem(title: 'حسابي', icon: Icons.person_pin),
              ],
              currentIndex: _selectedIndex,
              onTap: (position) => setState(() => _selectedIndex = position)),
        ),
        body: _widgetOptions.elementAt(_selectedIndex));
  }
}
