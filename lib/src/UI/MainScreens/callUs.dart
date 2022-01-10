import 'package:bashir_village/src/General%20Cubit/AdminPhoneCubit/admin_phone_cubit.dart';
import 'package:bashir_village/src/General%20Cubit/ContactUsCubit/contactUs_cubit.dart';
import 'package:bashir_village/src/UI/Basics/Register/Login/login.dart';
import 'package:bashir_village/src/UI/MainWidgets/customBtn.dart';
import 'package:bashir_village/src/UI/MainWidgets/customDrawer.dart';
import 'package:bashir_village/src/UI/MainWidgets/customLinearLoading.dart';
import 'package:bashir_village/src/UI/MainWidgets/customTextField.dart';
import 'package:bashir_village/src/UI/Notifications/notifications.dart';
import 'package:bashir_village/src/models/getAdminPhoneModel.dart';
import 'package:bashir_village/src/network/cachHelper.dart';
import 'package:bashir_village/src/provider/getAdminPhoneProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CallUs extends StatefulWidget {
  @override
  _CallUsState createState() => _CallUsState();
}

class _CallUsState extends State<CallUs> {
  String title;
  String message;


  _launchURL() async {
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
      appBar: AppBar(
        title: Text("تواصل معنا"),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => Notifications())),
          child: Icon(Icons.notifications),
        ),
      ),
      endDrawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: CacheHelper.getData(key: 'token') == null
          ? Center(
              child: CustomBtn(
                  text: 'تسجيل الدخول',
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => LoginPage()));
                  },
                  color: Theme.of(context).primaryColor),
            )
          : BlocBuilder<ContactUsCubit, ContactUsState>(
              builder: (context, state) {
                var cubit = ContactUsCubit.get(context);
                return ListView(
                  children: <Widget>[
                    SizedBox(height: 20),
                    CustomTextField(
                      maxLines: 1,
                      label: "",
                      hint: "رقم جوالك للتواصل معك",
                      icon: Icons.label,
                      onChang: (value) {
                        cubit.number = value ;
                        setState(() {
                          title = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      maxLines: 4,
                      label: "",
                      hint: 'الرسالة',
                      icon: Icons.sms,
                      high: 100,
                      onChang: (value) {
                        cubit.message = value ;
                        setState(() {
                          message = value;
                        });
                      },
                    ),
                    SizedBox(height: 30),
                    (state is ContactUsLoadingState)
                        ? CustomLinearLoading(horizontalPadding: 0,)
                        : CustomBtn(
                            text: 'إرسال',
                            onTap: () {

                              cubit.contactUs();
                            },
                            color: Theme.of(context).primaryColor,
                          ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        MaterialButton(
                          onPressed: () {
                            print("call user");
                            _launchURL();
                          },
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: Icon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "او يمكنك التواصل من خلال واتساب",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
    );
  }


}
