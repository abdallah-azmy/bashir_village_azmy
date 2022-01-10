import 'package:bashir_village/src/General%20Cubit/VideoGalleryCubit/video_gallery_cubit.dart';
import 'package:bashir_village/src/UI/Basics/Register/Login/login.dart';
import 'package:bashir_village/src/UI/MainWidgets/app_error.dart';
import 'package:bashir_village/src/UI/MainWidgets/customBtn.dart';
import 'package:bashir_village/src/UI/MainWidgets/customDrawer.dart';
import 'package:bashir_village/src/UI/MainWidgets/list_animator.dart';
import 'package:bashir_village/src/UI/SupScreens/Videos/Widgets/videosCard.dart';
import 'package:bashir_village/src/network/cachHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Videos extends StatefulWidget {
  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
//   SharedPreferences _prefs;
//
//   _getShared() async {
//     final _instance = await SharedPreferences.getInstance();
//     setState(() {
//       _prefs = _instance;
//     });
//     if (_prefs.get("token") == null) {
//     } else {
//       Provider.of<VideoProvider>(context, listen: false).getVideo().then((res) {
//         setState(() {
//           _model = res;
//         });
//       });
//     }
// //    notificationsBloc.updateToken(_prefs.get('token'));
//   }
//
//   VideoGallaryModel _model;
//   @override
//   void initState() {
//     super.initState();
//     _getShared();
//   }

  void initState() {
    VideoGalleryCubit.get(context).getVideoGallery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('معرض الفيديو'),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        endDrawer: CustomDrawer(),
        backgroundColor: Color.fromRGBO(242, 242, 242, 1),
        body: RefreshIndicator(
          onRefresh: () {
            return VideoGalleryCubit.get(context).getVideoGallery();
          },
          child: BlocBuilder<VideoGalleryCubit, VideoGalleryState>(
            builder: (context, state) {
              var cubit = VideoGalleryCubit.get(context);
              return Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child:
                // CacheHelper.getData(key: 'token') == null
                //     ? Center(
                //         child: CustomBtn(
                //             text: 'تسجيل الدخول',
                //             onTap: () {
                //               Navigator.pushReplacement(
                //                   context,
                //                   MaterialPageRoute(
                //                       builder: (_) => LoginPage()));
                //             },
                //             color: Theme.of(context).primaryColor),
                //       )
                //     :
                (state is VideoGalleryLoadingState)
                        ? Center(
                            child: SpinKitThreeBounce(
                              size: 25,
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        : (state is VideoGalleryErrorState)
                            ? AppError(
                                height: MediaQuery.of(context).size.height * .7,
                                text: state.error,
                              )
                            :

                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10,top: 10),
                  child: ListAnimator(
                    data: cubit.videos,
                    child: (index) {
                      return VideosCard(
                        label: cubit.videos[index].title,
                        video:
                          // "https://bashir.tqnee.com/uploads/news_videos/video_path_1641715802.mp4"
                        cubit.videos[index].videoLink
                            .length ==
                            0
                            ? ""
                            : cubit.videos[index]
                            .videoLink[0].videoLink.replaceAll("http", "https"),
                      );
                    },

                  ),
                ),
                // ListView(
                //                 children: <Widget>[
                //                   SizedBox(height: 20),
                //                   ListView.builder(
                //                     physics: ScrollPhysics(),
                //                     shrinkWrap: true,
                //                     itemCount: cubit.videos.length,
                //                     itemBuilder:
                //                         (BuildContext context, int index) {
                //                       return VideosCard(
                //                         label: cubit.videos[index].title,
                //                         video: cubit.videos[index].videoLink
                //                                     .length ==
                //                                 0
                //                             ? ""
                //                             : cubit.videos[index]
                //                                 .videoLink[0].videoLink,
                //                       );
                //                     },
                //                   ),
                //                 ],
                //               ),
              );
            },
          ),
        )

        // _prefs.get("token") == null
        //     ? Center(
        //         child: CustomBtn(
        //             text: 'تسجيل الدخول',
        //             onTap: () {
        //               Navigator.pushReplacement(context,
        //                   MaterialPageRoute(builder: (ctxt) => LoginPage()));
        //             },
        //             color: Theme.of(context).primaryColor),
        //       )
        //     : Padding(
        //         padding: const EdgeInsets.only(right: 10, left: 10),
        //         child: _model == null
        //             ? Center(
        //                 child: SpinKitThreeBounce(
        //                   size: 25,
        //                   color: Theme.of(context).primaryColor,
        //                 ),
        //               )
        //             : _model.data == null
        //                 ? Center(
        //                     child: Text("لا توجد فيديوهات للعرض"),
        //                   )
        //                 : ListView(
        //                     children: <Widget>[
        //                       SizedBox(height: 20),
        //                       ListView.builder(
        //                         physics: ScrollPhysics(),
        //                         shrinkWrap: true,
        //                         itemCount: _model.data.length,
        //                         itemBuilder: (BuildContext context, int index) {
        //                           return VideosCard(
        //                             label: _model.data[index].title,
        //                             video:
        //                                 _model.data[index].videoLink.length == 0
        //                                     ? ""
        //                                     : _model.data[index].videoLink[0]
        //                                         .videoLink,
        //                           );
        //                         },
        //                       ),
        //                     ],
        //                   ),
        //       ),
        );
  }
}
