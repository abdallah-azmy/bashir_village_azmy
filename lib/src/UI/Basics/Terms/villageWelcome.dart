import 'package:bashir_village/src/General%20Cubit/VillageWelcomeCubit/village_welcome_cubit.dart';
import 'package:bashir_village/src/UI/MainWidgets/app_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

class VillageWelcome extends StatefulWidget {
  @override
  _VillageWelcomeState createState() => _VillageWelcomeState();
}

class _VillageWelcomeState extends State<VillageWelcome> {
  @override
  void initState() {
    VillageWelcomeCubit.get(context).getVillageWelcomeData();
    super.initState();
  }

  _launchURL() async {
    const url = 'https://tqnee.com.sa';
    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title:
              Text('ترحيب عريفة القرية', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<VillageWelcomeCubit, VillageWelcomeState>(
          builder: (context, state) {
            var cubit = VillageWelcomeCubit.get(context);
            return (state is VillageWelcomeLoadingState)
                ? Center(
                    child: SpinKitThreeBounce(
                      size: 25,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : (state is VillageWelcomeErrorState)
                    ? AppError(
                        height: MediaQuery.of(context).size.height * .7,
                        text: state.error,
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  cubit.model.data.content,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              SizedBox(
                                height: 100,
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
                                            color: Colors.blueAccent,
                                            fontSize: 12),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
          },
        ));
  }
}
