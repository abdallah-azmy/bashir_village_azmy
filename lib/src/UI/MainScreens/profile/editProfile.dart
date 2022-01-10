import 'dart:io';

import 'package:bashir_village/src/General%20Cubit/EditProfileCubit/editProfile_cubit.dart';
import 'package:bashir_village/src/UI/MainWidgets/customBtn.dart';
import 'package:bashir_village/src/UI/MainWidgets/customDrawer.dart';
import 'package:bashir_village/src/UI/MainWidgets/customLinearLoading.dart';
import 'package:bashir_village/src/UI/MainWidgets/customTextField.dart';
import 'package:bashir_village/src/network/cachHelper.dart';
import 'package:bashir_village/src/provider/checkCodeEmail.dart';
import 'package:bashir_village/src/provider/editUserDataProvider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool selected = false;
  // ImageProvider _provider;
  File photo;
  String name;
  String email;
  bool _load = false;

  String code;
  String initimage;

  Future<bool> _onWillPop() async {
    photo == null
        ? Navigator.pop(context)
        : showDialog<bool>(
            context: context,
            builder: (_) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: AlertDialog(
                  content: Text("تجاهل التعديلات ؟"),
                  title: Text("تحذير!"),
                  actions: <Widget>[
                    TextButton(
                      child: Text("نعم"),
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          photo = null;
                          // _pref.setString("image", initimage);
                        });
                      },
                    ),
                    TextButton(
                      child: Text("لا"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          appBar: AppBar(
            title: Text("تعديل حسابي"),
            centerTitle: true,
            leading: InkWell(
              onTap: () => _onWillPop(),
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
          endDrawer: CustomDrawer(),
          backgroundColor: Colors.white,
          body: BlocBuilder<EditProfileCubit, EditProfileState>(
            builder: (context, state) {
              var cubit = EditProfileCubit.get(context);
              return ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 125,
                            width: 125,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: CacheHelper.getUserData().data[0].image ==
                                      null
                                  ? photo == null ? CircleAvatar(
                                      radius: 60,
                                      backgroundImage:
                                           AssetImage('assets/avatar.jpg')
                                         ) : Image.file(
                                File(photo.path) ,
                                fit: BoxFit.cover,
                              )
                                  : CachedNetworkImage(
                                      imageUrl: CacheHelper.getUserData()
                                                  .data[0]
                                                  .image ==
                                              null
                                          ? ""
                                          : CacheHelper.getUserData()
                                              .data[0]
                                              .image,
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
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (CacheHelper.getUserData().data[0].image !=
                                    null)
                                  initimage =
                                      CacheHelper.getUserData().data[0].image;
                              });

                              // _pickImg(ImageSource.gallery);
                              getImage();
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
                              child: Container(
                                height: 30,
                                width: 30,
                                child: Material(
                                  color: Theme.of(context).primaryColor,
                                  shape: CircleBorder(),
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomTextField(
                    label: '',
                    maxLines: 1,
                    icon: Icons.person,
                    hint: 'اسم المستخدم',
                    init: CacheHelper.getUserData().data[0].name,
                    high: 50,
                    onChang: (value) {
                      setState(() {
                        name = value;
                      });
                      cubit.name = name ;
                    },
                  ),
                  CustomTextField(
                    label: '',
                    icon: Icons.email,
                    maxLines: 1,
                    hint: "البريد الالكتروني",
                    init: CacheHelper.getUserData().data[0].email,
                    high: 50,
                    onChang: (value) {

                      setState(() {
                        if (value == CacheHelper.getUserData().data[0].email) {
                        } else {
                          email = value;
                        }
                      });
                      cubit.email = value ;
                    },
                  ),
                  SizedBox(height: 20),
                  (state is EditProfileLoadingState)
                      ? CustomLinearLoading(
                          horizontalPadding: 0,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: CustomBtn(
                              text: 'حفظ التعديلات',
                              onTap: () {
                                setState(() {
                                  _load = true;
                                });
                                // _saveForm();
                                cubit.editProfile();
                              },
                              color: Theme.of(context).primaryColor),
                        )
                ],
              );
            },
          )),
    );
  }

  _showCodeDialog() {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
                opacity: a1.value,
                child: SimpleDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Colors.white,
                  elevation: 5,
                  contentPadding: EdgeInsets.all(10),
                  children: <Widget>[
                    Center(
                        child: PinCodeTextField(
                      length: 4,
                      appContext: context,
                      onChanged: (_) {},
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // activeColor: Theme.of(context).primaryColor,
                      // inactiveColor: Colors.grey,
                      // textInputType: TextInputType.number,
                      autoFocus: true,
                      onCompleted: (String value) {
                        setState(() {
                          code = value;
                        });
                        Provider.of<CheckCodeEmail>(context, listen: false)
                            .confirmCode(
                                email, code, CacheHelper.getData(key: 'token'))
                            .then((res) {
                          switch (res.code) {
                            case 200:
                              print("done");
                              // CacheHelper.
                              // _pref.setString('email', email);
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SimpleDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      backgroundColor: Colors.white,
                                      elevation: 3,
                                      contentPadding: EdgeInsets.all(5),
                                      children: <Widget>[
                                        Text(
                                          'تم تعديل البيانات بنجاح',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 10, 10, 10),
                                          child: MaterialButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            elevation: 3,
                                            height: 45,
                                            color:
                                                Theme.of(context).primaryColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text(
                                              'موافق',
                                              style: TextStyle(fontSize: 17),
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
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      backgroundColor: Colors.white,
                                      elevation: 3,
                                      contentPadding: EdgeInsets.all(5),
                                      children: <Widget>[
                                        Text(
                                          res.error[0].value,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 10, 10, 10),
                                          child: MaterialButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            elevation: 3,
                                            height: 45,
                                            color:
                                                Color.fromRGBO(254, 206, 0, 1),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text(
                                              'موافق',
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                          }
                        });
                      },
                    )),
                    SizedBox(height: 20),
                    Center(
                      child: SlideCountdownClock(
                        duration: Duration(minutes: 1),
                        slideDirection: SlideDirection.Down,
                        tightLabel: true,
                        separator: ":",
                        textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20)
                  ],
                )),
          );
        },
        transitionDuration: Duration(milliseconds: 300),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        // ignore: missing_return
        pageBuilder: (context, animation1, animation2) {});
  }

  _saveForm() {
    Provider.of<EditUserDataProvider>(context, listen: false)
        .changeUserData(CacheHelper.getData(key: 'token'), name, email, photo)
        .then((response) {
      setState(() {
        _load = false;
      });
      if (response.code == 200) {
        print("${response.data.value}...............................");
        if (response.data.value == "تم ارسال الكود بنجاح") {
          // _pref.setString("name", name);

          _showCodeDialog();
        } else {
          if (response.data.image != null) {
            // _pref.setString("image", response.data.image);
          }
          // _pref.setString("name", name);
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
                      "تم تعديل البيانات",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
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
      } else {
        setState(() {
          // _pref.setString("image", initimage);
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
                    response.error[0].value,
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

  var image;
  Future getImage() async {
    var pic = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 60);
    print(">>>>>> $pic");
    setState(() {
      image = File(pic.path);
      photo = image;
      // _provider = Image.file(SimpleCropRoute.photo).image;
    });
    EditProfileCubit.get(context).image = image;
  }
  // _pickImg(ImageSource source) async {
  //
  //   if (image != null) {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (c) => SimpleCropRoute(
  //                   image: image,
  //                 ))).then((v) {
  //       setState(() {
  //         _provider = Image.file(SimpleCropRoute.photo).image;
  //         photo = SimpleCropRoute.photo;
  //         // if (photo != null) _pref.remove("image");
  //       });
  //     });
  //   }
  // }
}

class SimpleCropRoute extends StatefulWidget {
  final File image;
  const SimpleCropRoute({Key key, this.image}) : super(key: key);
  static File photo;
  @override
  _SimpleCropRouteState createState() => _SimpleCropRouteState();
}

class _SimpleCropRouteState extends State<SimpleCropRoute> {
  // final cropKey = GlobalKey<ImgCropState>();

  Future<Null> showImage(BuildContext context, File file) async {
    new FileImage(file)
        .resolve(new ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      print('-------------------------------------------$info');
    }));
    return showDialog<Null>(
        context: context,
        builder: (BuildContext context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
                actions: <Widget>[
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);

                        setState(() {
                          SimpleCropRoute.photo = file;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "حفظ",
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "الغاء",
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      ))
                ],
                title: Text(
                  'حفظ الصورة ',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).primaryColor,
                      letterSpacing: 1.1),
                ),
                content: Image.file(file)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'كبر وقص',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        leading: new IconButton(
          icon: new Icon(Icons.navigate_before, color: Colors.white, size: 40),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(),
      // ImgCrop(
      //   key: cropKey,
      //   // chipRadius: 100,
      //   // chipShape: 'rect',
      //   maximumScale: 3,
      //   image: FileImage(widget.image),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   onPressed: () async {
      //     final crop = cropKey.currentState;
      //     final croppedFile =
      //         await crop.cropCompleted(widget.image, pictureQuality: 600);
      //     showImage(context, croppedFile);
      //   },
      //   tooltip: 'Increment',
      //   child: Icon(Icons.crop_rotate),
      // )
    );
  }
}
