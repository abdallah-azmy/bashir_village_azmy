import 'package:bashir_village/src/General%20Cubit/SliderCubit/slider_cubit.dart';
import 'package:bashir_village/src/UI/MainWidgets/app_error.dart';
import 'package:bashir_village/src/UI/MainWidgets/app_loader.dart';
import 'package:bashir_village/src/UI/MainWidgets/customWidgetBody.dart';
import 'package:bashir_village/src/UI/MainWidgets/networkImage.dart';
import 'package:bashir_village/src/UI/SupScreens/News/newsDetails.dart';
import 'package:bashir_village/src/provider/pinNewsProvider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as p;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:intl/intl.dart' as intl;

import 'package:provider/provider.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  // getData() {
  //   Provider.of<PinNewsProvider>(context, listen: false).getPinNews();
  // }

  @override
  void initState() {
    // TODO: implement initState
    SliderCubit.get(context).getPinNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderCubit, SliderState>(builder: (context, state) {
      var cubit = SliderCubit.get(context);
      return Directionality(
          textDirection: p.TextDirection.rtl,
          child: (state is SliderLoadingState)
              ? AppLoader(
                  height: MediaQuery.of(context).size.height * .3,
                  color: Colors.white,
                )
              : (state is SliderErrorState)
                  ? AppError(
                      height: MediaQuery.of(context).size.height * .3,
                      text: state.error,
                    )
                  : cubit.model == null
                      ? Center(
                          child: Icon(Icons.error),
                        )
                      : Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => NewsDetails(
                                              title:
                                                  cubit.model.data[index].title,
                                              content: cubit
                                                  .model.data[index].content,
                                              images: cubit
                                                  .model.data[index].photos,
                                              createAt: cubit
                                                  .model.data[index].createdAt,
                                              comments: cubit
                                                  .model.data[index].comments,
                                              newsId:
                                                  cubit.model.data[index].id,
                                              seen:
                                                  cubit.model.data[index].seen,
                                            ))).then((val) => val
                                    ? SliderCubit.get(context).getPinNews()
                                    : null);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Directionality(
                                  textDirection: p.TextDirection.rtl,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 150,
                                        //MediaQuery.of(context).size.height / 5,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              topRight: Radius.circular(10.0)),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              topRight: Radius.circular(10.0)),
                                          child: CustomNetworkImage(
                                            image: cubit.model.data[index]
                                                        .photos.length ==
                                                    0
                                                ? ""
                                                : cubit.model.data[index]
                                                    .photos[0].photo,
                                            fit: BoxFit.fill,
                                          ),

                                          // CachedNetworkImage(
                                          //   imageUrl: pinNewsProvider
                                          //               .model.data[index].photos.length ==
                                          //           0
                                          //       ? ""
                                          //       : pinNewsProvider
                                          //           .model.data[index].photos[0].photo,
                                          //   errorWidget: (context, url, error) => ClipRRect(
                                          //       borderRadius: BorderRadius.only(
                                          //           topLeft: Radius.circular(10.0),
                                          //           topRight: Radius.circular(10.0)),
                                          //       child: Image.asset('assets/placeholder.png',
                                          //           fit: BoxFit.cover)),
                                          //   fadeInDuration: Duration(seconds: 2),
                                          //   placeholder: (context, url) => ClipRRect(
                                          //       borderRadius: BorderRadius.only(
                                          //           topLeft: Radius.circular(10.0),
                                          //           topRight: Radius.circular(10.0)),
                                          //       child: Image.asset('assets/placeholder.png',
                                          //           fit: BoxFit.fill)),
                                          //   imageBuilder: (context, provider) {
                                          //     return ClipRRect(
                                          //         borderRadius: BorderRadius.only(
                                          //             topLeft: Radius.circular(10.0),
                                          //             topRight: Radius.circular(10.0)),
                                          //         child: Image(
                                          //           image: provider,
                                          //           fit: BoxFit.fill,
                                          //         ));
                                          //   },
                                          // ),
                                        ),
                                      ),
                                      Container(
                                          height: 70,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10.0),
                                                  bottomRight:
                                                      Radius.circular(10.0))),
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: Container(
                                                    height: 20,
                                                    child: Text(
                                                      cubit.model.data[index]
                                                          .title,
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: 15,
                                                  child: Directionality(
                                                    textDirection:
                                                        p.TextDirection.ltr,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons.share,
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          size: 14,
                                                        ),
                                                        Row(
                                                          children: <Widget>[
                                                            Text(
                                                              "${cubit.model.data[index].comments.length}",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            ),
                                                            Icon(
                                                              Icons.comment,
                                                              size: 14,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: <Widget>[
                                                            Text(
                                                              cubit
                                                                  .model
                                                                  .data[index]
                                                                  .seen
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .remove_red_eye,
                                                              size: 14,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                            )
                                                          ],
                                                        ),
                                                        Text(
                                                          "${intl.DateFormat.d().format(cubit.model.data[0].createdAt)}/${intl.DateFormat.M().format(cubit.model.data[0].createdAt)}/${intl.DateFormat.y().format(cubit.model.data[0].createdAt)}",
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: cubit.model.data.length,
                          itemWidth: MediaQuery.of(context).size.width / 1.2,
                          viewportFraction: 0.8,
                          scale: 0.85,
                          autoplay: true,
                          loop: true,
                        ));
    });
  }
}
