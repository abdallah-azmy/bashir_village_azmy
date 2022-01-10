import 'package:bashir_village/src/General%20Cubit/PhotoGalleryCubit/photo_gallery_cubit.dart';
import 'package:bashir_village/src/UI/Basics/Register/Login/login.dart';
import 'package:bashir_village/src/UI/MainWidgets/app_error.dart';
import 'package:bashir_village/src/UI/MainWidgets/customBtn.dart';
import 'package:bashir_village/src/UI/MainWidgets/customDrawer.dart';
import 'package:bashir_village/src/UI/MainWidgets/list_animator.dart';
import 'package:bashir_village/src/UI/SupScreens/Photos/Widgets/photosCard.dart';
import 'package:bashir_village/src/network/cachHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Photos extends StatefulWidget {
  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  @override
  void initState() {
    PhotoGalleryCubit.get(context).getPhotoGallery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('معرض الصور'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      endDrawer: CustomDrawer(),
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      body:  RefreshIndicator(
              onRefresh: () {
                return PhotoGalleryCubit.get(context).getPhotoGallery();
              },
              child: BlocBuilder<PhotoGalleryCubit, PhotoGalleryState>(
                builder: (context, state) {
                  var cubit = PhotoGalleryCubit.get(context);
                  return Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child:
                    // CacheHelper.getData(key: 'token') == null
                    //     ? Center(
                    //   child: CustomBtn(
                    //       text: 'تسجيل الدخول',
                    //       onTap: () {
                    //         Navigator.pushReplacement(context,
                    //             MaterialPageRoute(builder: (_) => LoginPage()));
                    //       },
                    //       color: Theme.of(context).primaryColor),
                    // )
                    //     :
                    (state is PhotoGalleryLoadingState)
                        ? Center(
                            child: SpinKitThreeBounce(
                              size: 25,
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        : (state is PhotoGalleryErrorState)
                            ? AppError(
                                height: MediaQuery.of(context).size.height * .7,
                                text: state.error,
                              )
                            : Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10,top: 10),
                              child: ListAnimator(
                                data: cubit.photos,
                                child: (index) {
                                  return PhotosCard(
                                    content:
                                    cubit.photos[index].content,
                                    images: cubit.photos[index].photos,
                                    label: cubit.photos[index].title,
                                  );
                                },

                              ),
                            ),
                  );
                },
              ),
            ),
    );
  }
}
