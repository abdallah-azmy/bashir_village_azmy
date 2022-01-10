import 'package:bashir_village/src/General%20Cubit/AboutVillageCubit/about_village_cubit.dart';
import 'package:bashir_village/src/UI/MainWidgets/app_error.dart';
import 'package:bashir_village/src/UI/MainWidgets/customDrawer.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutVillage extends StatefulWidget {
  @override
  _AboutVillageState createState() => _AboutVillageState();
}

class _AboutVillageState extends State<AboutVillage> {


  @override
  void initState() {
    AboutVillageCubit.get(context).getAboutVillageData();
    super.initState();
  }

  Widget _imageSlider() {
    return Container(
      height: 300,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: List.generate(AboutVillageCubit.get(context).model.data[0].photos.length, (int index) {
          return NetworkImage(AboutVillageCubit.get(context).model.data[0].photos[index].photo);
        }),
        autoplay: false,
        dotSize: 4,
        dotBgColor: Colors.black26,
        animationCurve: Curves.decelerate,
        animationDuration: Duration(milliseconds: 1000),
        indicatorBgPadding: 10,
        dotColor: Colors.white,
      ),
    );
  }

  _launchURL() async {
    const url = 'https://tqnee.com.sa';
    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('حول قرية بشير', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<AboutVillageCubit,AboutVillageState>(
        builder: (context,state){
          var cubit = AboutVillageCubit.get(context);
          return


          (state is AboutVillageLoadingState)
              ? Center(
            child: SpinKitThreeBounce(
              size: 25,
              color: Theme.of(context).primaryColor,
            ),
          )
              : (state is AboutVillageErrorState)
              ? AppError(
            height: MediaQuery.of(context).size.height * .7,
            text: state.error,
          )

              :

          Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                _imageSlider(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    cubit.model.data[0].content,
                    style:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
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
                )
              ],
            ),
          );
        },
      )
    );
  }
}
