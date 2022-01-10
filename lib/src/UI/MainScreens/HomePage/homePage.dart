import 'package:bashir_village/src/General%20Cubit/SliderCubit/slider_cubit.dart';
import 'package:bashir_village/src/General%20Cubit/UnPinnedNewsCubit/unPinned_News_cubit.dart';
import 'package:bashir_village/src/UI/MainWidgets/app_error.dart';
import 'package:bashir_village/src/UI/MainWidgets/app_loader.dart';
import 'package:bashir_village/src/UI/MainWidgets/customCard.dart';
import 'package:bashir_village/src/UI/MainWidgets/customDrawer.dart';
import 'package:bashir_village/src/UI/MainWidgets/customWidgetBody.dart';
import 'package:bashir_village/src/UI/MainWidgets/list_animator.dart';
import 'package:bashir_village/src/UI/Notifications/notifications.dart';
import 'package:bashir_village/src/UI/SupScreens/News/newsDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Widgets/customCircleBtn.dart';
import 'Widgets/slider.dart';
import 'Widgets/unPinNewsScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> _list = [
    Category(label: 'عن القرية', img: 'assets/about.png', type: 0),
    Category(label: 'لحظة بلحظة', img: 'assets/timer.png', type: 5),
    Category(label: 'معرض الصور', img: 'assets/photo.png', type: 3),
    Category(label: 'معرض الفيديو', img: 'assets/video.png', type: 4),
    Category(label: 'ارسال خبر', img: 'assets/whatsapp.png', type: 1)
  ];

  // GetAdminPhone adminPhoneModel;

  _getData() {
    UnPinnedNewsCubit.get(context).getUnPinnedNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("قرية بشير"),
          centerTitle: true,
          leading: InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => Notifications())),
            child: Icon(Icons.notifications),
          ),
        ),
        endDrawer: CustomDrawer(),
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          onRefresh: () {
            SliderCubit.get(context).getPinNews();
            return UnPinnedNewsCubit.get(context).getUnPinnedNews();
          },
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    color: Theme.of(context).primaryColor,
                    height: 240,
                    child: SliderWidget()),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    height: 100,
                    child: Center(
                        child: ListAnimator(
                      physics: false,
                      scrollDirection: Axis.horizontal,
                      data: _list,
                      child: (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomCircleBtn(
                            title: _list[index].label,
                            img: _list[index].img,
                            type: _list[index].type,
                          ),
                        );
                      },
                    )),
                  ),
                ),
                Container(
                  // height: MediaQuery.of(context).size.height/3,
                  child: CustomWidgetBody(
                    service: UnPinnedNewsCubit.get(context).getUnPinnedNews(),
                    // Provider.of<UnPinNewsProvider>(context, listen: false)
                    //     .getUnPinNews(),
                    body: BlocBuilder<UnPinnedNewsCubit, UnPinnedNewsState>(
                        builder: (context, state) {
                      var cubit = UnPinnedNewsCubit.get(context);
                      return (state is UnPinnedNewsLoadingState)
                          ? AppLoader(
                              height: MediaQuery.of(context).size.height * .3,
                            )
                          : (state is UnPinnedNewsErrorState)
                              ? AppError(
                                  height:
                                      MediaQuery.of(context).size.height * .3,
                                  text: state.error,
                                )
                              : ListView(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: [
                                    ListAnimator(
                                      physics: false,
                                      data: cubit.model.data,
                                      child: (index) {
                                        return CustomCard(
                                          image: cubit.model.data[index].photos
                                                      .length ==
                                                  0
                                              ? ""
                                              : cubit.model.data[index]
                                                  .photos[0].photo,
                                          title: cubit.model.data[index].title,
                                          createdAt:
                                              cubit.model.data[index].createdAt,
                                          numComment: cubit.model.data[index]
                                              .comments.length,
                                          seen: cubit.model.data[index].seen,
                                          newsId: cubit.model.data[index].id,
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) => NewsDetails(
                                                          title: cubit
                                                              .model
                                                              .data[index]
                                                              .title,
                                                          content: cubit
                                                              .model
                                                              .data[index]
                                                              .content,
                                                          images: cubit
                                                              .model
                                                              .data[index]
                                                              .photos,

                                                          videos: cubit
                                                              .model
                                                              .data[index].videos,

                                                      videosLinks: cubit
                                                          .model
                                                          .data[index].videoLinks
                                                      ,
                                                          phones: cubit
                                                              .model
                                                              .data[index].phones,
                                                          createAt:
                                                              DateTime.now(),
                                                          comments: cubit
                                                              .model
                                                              .data[index]
                                                              .comments,
                                                          newsId: cubit.model
                                                              .data[index].id,
                                                          seen: cubit.model
                                                              .data[index].seen,
                                                        )));
                                                // .then((val) =>
                                                // val ? _getData() : _getData());
                                          },
                                        );
                                      },
                                    ),

                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (c) =>
                                                    UnPinNewsScreen()));
                                      },
                                      child: Container(
                                        color: Colors.grey[100],
                                        height: 50,
                                        child: Center(
                                            child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "رؤية المزيد من الاخبار",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[700]),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 15,
                                              color: Colors.grey[700],
                                            )
                                          ],
                                        )),
                                      ),
                                    )
                                  ],
                                );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class Category {
  String label;
  String img;
  int type;

  Category({this.label, this.img, this.type});
}
