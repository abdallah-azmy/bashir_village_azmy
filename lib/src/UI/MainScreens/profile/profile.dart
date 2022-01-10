import 'package:bashir_village/src/General%20Cubit/AdminPhoneCubit/admin_phone_cubit.dart';
import 'package:bashir_village/src/Helpers/route.dart';
import 'package:bashir_village/src/UI/Basics/Register/Login/login.dart';
import 'package:bashir_village/src/UI/MainScreens/profile/fav.dart';
import 'package:bashir_village/src/UI/MainWidgets/customBtn.dart';
import 'package:bashir_village/src/UI/MainWidgets/customDrawer.dart';
import 'package:bashir_village/src/UI/mainPage.dart';
import 'package:bashir_village/src/network/cachHelper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../models/getAdminPhoneModel.dart';
import '../../../provider/getAdminPhoneProvider.dart';
import '../about.dart';
import 'editPassword.dart';
import 'editProfile.dart';

class Profile extends StatefulWidget {
  final Icon icon;

  const Profile({Key key, this.icon}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  _launchURLPhone() async {
    var url = 'https://wa.me/${AdminPhoneCubit.get(context).model.data.value}';
    await launch(url);
  }
  @override
  void initState() {
    // TODO: implement initState
    AdminPhoneCubit.get(context).getAdminPhoneData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          'حسابي',
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: widget.icon == null
                ? null
                : () {
                    Navigator.pop(context);
                  },
            child: Icon(widget.icon == null ? null : Icons.arrow_back_ios)),
      ),
      body:
      // _prefs == null
      //     ? Center(
      //         child: SpinKitThreeBounce(
      //           size: 25,
      //           color: Theme.of(context).primaryColor,
      //         ),
      //       )
      //     :
      CacheHelper.getData(key: 'token') == null //
              ? Center(
                  child: CustomBtn(
                      text: 'تسجيل الدخول',
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => LoginPage()));
                      },
                      color: Theme.of(context).primaryColor),
                )
              : Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10,),
                    children: <Widget>[
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.only(right: 10, left: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text( CacheHelper.getUserData().data[0].name,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18)),
                                SizedBox(width: 20),
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: CachedNetworkImage(
                                      imageUrl: CacheHelper.getUserData().data[0].image == null
                                          ? ""
                                          : CacheHelper.getUserData().data[0].image,
                                      errorWidget: (context, url, error) =>
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: Image.asset(
                                                  'assets/avatar.jpg',
                                                  fit: BoxFit.fill)),
                                      fadeInDuration: Duration(seconds: 2),
                                      placeholder: (context, url) => ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.asset(
                                              'assets/avatar.jpg',
                                              fit: BoxFit.fill)),
                                      imageBuilder: (context, provider) {
                                        return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image(
                                              image: provider,
                                              fit: BoxFit.cover,
                                            ));
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 35),
                      _optionCard("المفضلة", Icons.favorite, onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FavScreen()));
                      }),
                      _optionCard(" تعديل حسابي", Icons.edit, onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfile()));
                      }),
                      _optionCard("عن التطبيق  ", Icons.arrow_back_ios,
                          onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AboutUs()));
                      }),
                      _optionCard("مركز المساعدة", FontAwesomeIcons.whatsapp,
                          onTap: () {
                            print("call user");
                            _launchURLPhone();
                      }),
                      _optionCard("كلمة السر", Icons.edit, onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditPassword()));
                      }),
                      _optionCard("تسجيل الخروج", Icons.exit_to_app, onTap: () {
                        CacheHelper.removeData(key: "token");
                        CacheHelper.removeData(key: "userData");
                        // _prefs.remove("name");
                        // _prefs.remove("email");
                        // _prefs.remove("id");
                        // _prefs.remove("active");
                        // _prefs.remove("token");
                        // _prefs.remove("image");
                        push(context,  MainPage());
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => MainPage()));
                      }),
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

  Widget _optionCard(String txt, IconData icon, {Function onTap}) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: onTap,
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(icon, color: Colors.grey, size: 20),
                  Text(
                    txt,
                    style: TextStyle(fontSize: 17),
                  )
                ],
              ),
            ),
          ),
        ),
        Divider(
          height: 1,
        )
      ],
    );
  }

  _launchURL() async {
    const url = 'https://tqnee.com.sa';
    launch(url);
  }
}
