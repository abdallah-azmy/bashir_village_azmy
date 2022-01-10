// import 'dart:io';
// import 'package:bashir_village/src/Helpers/myColors.dart';
// import 'package:bashir_village/src/UI/MainWidgets/networkImage.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:easycard/src/General%20Cubit/AddCardToMyWalletCubit/add_card_toMyFav_cubit.dart';
// import 'package:easycard/src/General%20Cubit/BusinessCardByIdCubit/business_card_byId_cubit.dart';
// import 'package:easycard/src/General%20Cubit/CardAdvantagesCubit/card_advantages_cubit.dart';
// import 'package:easycard/src/General%20Cubit/ExchangeCardCubit/exchange_Card_cubit.dart';
// import 'package:easycard/src/Helpers/myColors.dart';
// import 'package:easycard/src/Helpers/route.dart';
// import 'package:easycard/src/MainScreens/Drawer/InternalScreens/Notifications/widgets/customExpandedCardFromNotification.dart';
// import 'package:easycard/src/MainScreens/HomeScreen/UserCardsCubit/user_cards_cubit.dart';
// import 'package:easycard/src/MainScreens/MyCradsWallet/MyCategoriesCubit/my_Categories_cubit.dart';
// import 'package:easycard/src/MainScreens/MyCradsWallet/widgets/groubCardCustomed.dart';
// import 'package:easycard/src/MainScreens/MyCradsWallet/widgets/customMyExpandedCardForExchange.dart';
// import 'package:easycard/src/MainScreens/HomeScreen/widgets/businessCardTutorial.dart';
// import 'package:easycard/src/MainWidgets/Special_Button.dart';
// import 'package:easycard/src/MainWidgets/animatedWidget.dart';
// import 'package:easycard/src/MainWidgets/app_error.dart';
// import 'package:easycard/src/MainWidgets/app_loader.dart';
// import 'package:easycard/src/MainWidgets/customCircularLoading.dart';
// import 'package:easycard/src/MainWidgets/customWidgetBody.dart';
// import 'package:easycard/src/MainWidgets/list_animator.dart';
// import 'package:easycard/src/MainWidgets/networkImage.dart';
// import 'package:easycard/src/MainWidgets/photoGallaryString.dart';
// import 'package:easycard/src/MainWidgets/toast.dart';
// import 'package:easycard/src/Models/get/myBusinessCards.dart';
// import 'package:easycard/src/Provider/post/payValueOfBusinessCardProvider.dart';
// import 'package:easycard/src/Provider/post/renuSubscriptionForCardProvider.dart';
// import 'package:easycard/src/Repository/appLocalization.dart';
// import 'package:esys_flutter_share/esys_flutter_share.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:lottie/lottie.dart';
// import 'package:provider/provider.dart';
// import 'package:share/share.dart';
//
// class LoadingDialog {
//   var scaffold;
//   var context;
//
//   LoadingDialog(this.scaffold, this.context);
//
//   showQRCode(
//       {String imageUrl,
//       BuildContext context,
//       String link,
//       var logo,
//       var jop,
//       var name}) {
//     showDialog(
//         barrierDismissible: true,
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             contentPadding: EdgeInsets.all(5),
//             elevation: 0,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(16))),
//             backgroundColor: Colors.transparent,
//             content: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16)),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Container(
//                         decoration: BoxDecoration(
//                             color: MyColors.lightBlue,
//                             borderRadius: BorderRadius.circular(8)),
//                         padding: const EdgeInsets.symmetric(horizontal: 25),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Flexible(
//                                 child: Padding(
//                               padding:
//                                   const EdgeInsets.only(top: 16, bottom: 7),
//                               child: Text(
//                                 "Scan me!",
//                                 style: MyColors.styleBold2white,
//                                 textAlign: TextAlign.center,
//                               ),
//                             )),
//                             imageUrl == null
//                                 ? Container(
//                                     color: Colors.black,
//                                     child: Lottie.asset(
//                                       'assets/lolitJson/errorNotFound.json',
//                                       fit: BoxFit.fill,
//                                     ),
//                                   )
//                                 : Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(9),
//                                           color: Colors.white),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(14.0),
//                                         child: CustomNetworkImage(
//                                           image: imageUrl,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                             Flexible(
//                                 child: Padding(
//                               padding: const EdgeInsets.only(top: 6, bottom: 2),
//                               child: Text(
//                                 "$name",
//                                 style: MyColors.styleNormalWhite,
//                                 textAlign: TextAlign.center,
//                               ),
//                             )),
//                             jop == null
//                                 ? Container()
//                                 : Flexible(
//                                     child: Text(
//                                     "$jop",
//                                     style: MyColors.styleNormalWhite0,
//                                     textAlign: TextAlign.center,
//                                   )),
//                             SizedBox(
//                               height: 16,
//                             )
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 14,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 2.0),
//                             child: SpecialButton(
//                               text: localization.text("share"),
//                               radius: 24.0,
//                               paddingHorizontal: 7.0,
//                               color: MyColors.green,
//                               icon: Container(
//                                 child:
//                                     SvgPicture.asset("assets/icon/share.svg"),
//                               ),
//                               iconBackColor: Colors.transparent,
//                               height: 40.0,
//                               onTap: () async {
//                                 String subject = 'EasyCard';
//                                 Share.share(link, subject: subject);
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 )),
//           );
//         });
//   }
//
//   showQRCodeNew(
//       {String imageUrl,
//       BuildContext context,
//       String link,
//       var description,
//       var name}) {
//     showDialog(
//         barrierDismissible: true,
//         context: context,
//         builder: (BuildContext context) {
//
//           return AlertDialog(
//             contentPadding: EdgeInsets.all(0),
//             elevation: 0,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(5))),
//             backgroundColor: Colors.transparent,
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Stack(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 20),
//                       child: Container(
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10)),
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 25, vertical: 15),
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: <Widget>[
// //                                Flexible(
// //                                    child: Padding(
// //                                  padding:
// //                                      const EdgeInsets.only(top: 10, bottom: 0),
// //                                  child: Text(
// //                                    "$name",
// //                                    style: MyColors.styleBold1,
// //                                    textAlign: TextAlign.center,
// //                                  ),
// //                                )),
//
//                                 description == null
//                                     ? Container()
//                                     : Flexible(
//                                         child: Padding(
//                                         padding: const EdgeInsets.only(
//                                             top: 8, bottom: 0),
//                                         child: Text(
//                                           "$description",
//                                           style: MyColors.styleBold1,
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       )),
// //                                SizedBox(
// //                                  height: 10,
// //                                ),
// //                                InkWell(
// //                                    onTap: () {
// //
// //                                      _makePhoneCall(link);
// //                                    },
// //                                    child: Text(
// //                                      "$link",
// //                                      style: TextStyle(
// //                                          color: Colors.blue,
// //                                          fontWeight: FontWeight.bold),
// //                                    )),
//
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//
// //                                Padding(
// //                                  padding: const EdgeInsets.all(8.0),
// //                                  child: SpecialButton(
// //                                    text:localization.text("share"),
// //                                    icon: Icon(Icons.share_outlined,color: Colors.white,),
// //                                    iconBackColor: Colors.transparent,
// //                                    height: 40.0,
// //                                    onTap: () async {
// //                                      String subject = 'EasyCard';
// //                                        Share.share(link, subject: subject);
// //
// //                                    },
// //                                  ),
// //                                ),
// //                                Flexible(
// //                                    child: Padding(
// //                                      padding: const EdgeInsets.only(
// //                                           bottom: 12),
// //                                      child: SelectableText(
// //                                        "$link",
// //                                        style: MyColors.styleBoldSmall,
// //                                        textAlign: TextAlign.center,
// //                                      ),
// //                                    )),
//                                 imageUrl == null
//                                     ? Container(
//                                         color: Colors.black,
//                                         child: Lottie.asset(
//                                           'assets/lolitJson/errorNotFound.json',
//                                           fit: BoxFit.fill,
//                                         ),
//                                       )
//                                     : Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Padding(
//                                           padding:
//                                               const EdgeInsets.only(bottom: 12),
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(15.0),
//                                             child: CustomNetworkImage(
//                                               image: imageUrl,
//                                               fit: BoxFit.fill,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                               ],
//                             ),
//                           )),
//                     ),
// //                    Align(
// //                      alignment: Alignment.topCenter,
// //                      child: ClipOval(
// //                        child: Container(
// //                          color: Colors.white,
// //                          child: Padding(
// //                            padding: const EdgeInsets.all(4.0),
// //                            child: Container(
// //                              height: 70,
// //                              width: 70,
// //                              child: ClipOval(
// //                                  child: CustomProductImage(
// //                                    image: logo,
// //                                  )
// ////
// //                              ),
// //                            ),
// //                          ),
// //                        ),
// //                      ),
// //                    ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         });
//   }
//
//   showLoadingDialog() {
//     showDialog(
//         barrierDismissible: false,
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             contentPadding: EdgeInsets.all(0),
//             elevation: 0,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(10))),
//             backgroundColor: Colors.transparent,
//             content: SpinKitDualRing(
//               color: Colors.black,
//               size: 30.0,
//             ),
//           );
//         });
//   }
//
//   showDoubleNotification(title, msg) {
//     scaffold.currentState.showSnackBar(
//       SnackBar(
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               title,
//               style: MyColors.styleBold2white,
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Text(
//               msg,
//               style: MyColors.styleBold1white,
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//         backgroundColor: Colors.black,
//         duration: Duration(seconds: 3),
//       ),
//     );
//   }
//
//   logOutAlert(String text, function) {
//     showDialog(
//         barrierDismissible: false,
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             contentPadding: EdgeInsets.all(0),
//             elevation: 0,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(10))),
//             backgroundColor: Colors.transparent,
//             content: Container(
//                 height: 150,
//                 decoration: BoxDecoration(
//                     color: MyColors.blueBlack,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       Text(
//                         text ?? localization.text("logout_ask"),
//                         style: MyColors.styleBold2white,
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Flexible(
//                             child: SpecialButton(
//                               onTap: function,
//                               text: localization.text("confirm"),
// //                              width: 85.0,
//                               color: Colors.red,
//                               textColor: Colors.white,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 8,
//                           ),
//                           Flexible(
//                             child: SpecialButton(
//                               onTap: () {
//                                 Navigator.pop(context);
//                               },
//                               text: localization.text("cancel"),
// //                              width: 85.0,
//                               color: Colors.green,
//                               textColor: Colors.white,
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 )),
//           );
//         });
//   }
//
//   photosAlbumAlert({String text, function, List<CardImages> photos}) {
//     showDialog(
//         barrierDismissible: false,
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             contentPadding: EdgeInsets.all(0),
//             elevation: 5,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(16))),
//             backgroundColor: Colors.transparent,
//             content: Container(
// //                height: 150,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16)),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       SizedBox(
//                         height: 8,
//                       ),
//                       Text(
//                         text ?? localization.text("Photos album"),
//                         style: TextStyle(
//                             color: MyColors.lightBlue,
//                             fontSize: 16,
//                             fontFamily: "IBM Plex Arabic",
//                             fontWeight: FontWeight.w700),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       Container(
//                         height: MediaQuery.of(context).size.height * .5,
//                         child: GridView.count(
//                           primary: false,
//                           shrinkWrap: true,
//                           physics: AlwaysScrollableScrollPhysics(),
//                           padding: const EdgeInsets.all(1),
//                           crossAxisSpacing: 1,
//                           childAspectRatio: (5 / 6),
//                           mainAxisSpacing: 1,
//                           crossAxisCount: 2,
//                           children: List.generate(photos.length, (index) {
//                             return AnimatedSpecialWidget(
//                               duration: 250,
//                               child: (i) => InkWell(
//                                 onTap: () {
//                                   //PhotoGalleryString
//                                   push(
//                                       context,
//                                       PhotoGalleryString(
//                                         image: photos[i].image,
//                                       ));
//                                 },
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(8.0),
//                                     child: CustomNetworkImage(
//                                       image: photos[i].image,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               index: index,
//                             );
//                           }),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Flexible(
//                             child: SpecialButton(
//                               onTap: () {
//                                 Navigator.pop(context);
//                               },
//                               text: localization.text("_close"),
//                               radius: 24.0,
// //                              width: 85.0,
//                               color: MyColors.lightBlue,
//                               textColor: Colors.white,
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 )),
//           );
//         });
//   }
//
//   iconsAlbumAlert(
//       {String text, function, List<dynamic> photos, bool editType}) {
//     showDialog(
//         barrierDismissible: false,
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             contentPadding: EdgeInsets.all(0),
//             elevation: 5,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(16))),
//             backgroundColor: Colors.transparent,
//             content: Container(
// //                height: 150,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16)),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       SizedBox(
//                         height: 8,
//                       ),
//                       Text(
//                         text ?? localization.text("choose icon"),
//                         style: TextStyle(
//                             color: MyColors.lightBlue,
//                             fontSize: 16,
//                             fontFamily: "IBM Plex Arabic",
//                             fontWeight: FontWeight.w700),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       Container(
//                         height: MediaQuery.of(context).size.height * .5,
//                         child: GridView.count(
//                           primary: false,
//                           shrinkWrap: true,
//                           physics: AlwaysScrollableScrollPhysics(),
//                           padding: const EdgeInsets.all(10),
//                           crossAxisSpacing: 10,
//                           childAspectRatio: (5 / 6),
//                           mainAxisSpacing: 10,
//                           crossAxisCount: 3,
//                           children: List.generate(photos.length, (index) {
//                             return AnimatedSpecialWidget(
//                               duration: 250,
//                               child: (i) => InkWell(
//                                 onTap: () {
//                                   if (editType == null) {
//                                     MyCategoriesCubit.get(context).iconIdAdd =
//                                         photos[index].id;
//                                   } else {
//                                     MyCategoriesCubit.get(context).iconIdEdit =
//                                         photos[index].id;
//                                   }
//
//                                   function(photos[index].icon);
//                                   Navigator.pop(context);
//                                 },
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(16.0),
//                                   child: Container(
//                                     height: 72,
//                                     width: 72,
//                                     color: Color(0xff8B98A6),
//                                     child: Center(
//                                       child: Container(
//                                         height: 40,
//                                         width: 40,
//                                         child: CustomNetworkImage(
//                                           image: photos[i].icon,
//                                           fit: BoxFit.fill,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               index: index,
//                             );
//                           }),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Flexible(
//                             child: SpecialButton(
//                               onTap: () {
//                                 Navigator.pop(context);
//                               },
//                               text: localization.text("_close"),
//                               radius: 24.0,
// //                              width: 85.0,
//                               color: MyColors.lightBlue,
//                               textColor: Colors.white,
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 )),
//           );
//         });
//   }
//
//   deleteAlert(String text, function) {
//     showDialog(
//         barrierDismissible: false,
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             contentPadding: EdgeInsets.all(0),
//             elevation: 0,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(10))),
//             backgroundColor: Colors.transparent,
//             content: Container(
//                 height: 150,
//                 decoration: BoxDecoration(
//                     color: MyColors.blueBlack,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       Text(
//                         text ?? localization.text("delete"),
//                         style: MyColors.styleBold2white,
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Flexible(
//                             child: SpecialButton(
//                               onTap: function,
//                               text: localization.text("confirm"),
//                               color: Colors.red,
//                               textColor: Colors.white,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Flexible(
//                             child: SpecialButton(
//                               onTap: () {
//                                 Navigator.pop(context);
//                               },
//                               text: localization.text("cancel"),
//                               color: Colors.green,
//                               textColor: Colors.white,
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 )),
//           );
//         });
//   }
//
//   questionOneButton(
//       {@required String title,
//       @required String text,
//       function,
//       @required String buttonText,
//       var buttonColor,
//       var icon}) {
//     showDialog(
//         barrierDismissible: true,
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             contentPadding: EdgeInsets.all(3),
//             elevation: 0,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(16))),
//             backgroundColor: Colors.transparent,
//             content: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16)),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 18, vertical: 24),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         Text(
//                           title,
//                           style: MyColors.styleBoldBlue,
//                           textAlign: TextAlign.center,
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Flexible(
//                               child: Text(
//                                 text,
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontFamily: "IBM Plex Arabic",
//                                     fontWeight: FontWeight.w400),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 13,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             Flexible(
//                               child: SpecialButton(
//                                 onTap: function,
//                                 text: buttonText,
//                                 color: buttonColor ?? Colors.green,
//                                 radius: 24.0,
//                                 textColor: Colors.white,
//                                 icon: ClipRRect(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(50)),
//                                   child: Container(
//                                     height: 22,
//                                     width: 22,
//                                     color: Colors.white.withOpacity(.4),
//                                     child: Center(
//                                       child: Icon(
//                                         icon ?? Icons.check,
//                                         color: Colors.white,
//                                         size: 15,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   )),
//             ),
//           );
//         });
//   }
//
//   questionTwoButton(
//       {@required String title,
//       @required String text,
//       @required String rightButtonText,
//       @required String leftButtonText,
//       var rightButtonColor,
//       var leftButtonColor,
//       var leftButtonFunction,
//       var rightButtonFunction}) {
//     showDialog(
//         barrierDismissible: true,
//         context: context,
//         builder: (BuildContext context) {
//           return Directionality(
//             textDirection: localization.currentLanguage.toString() == "en"
//                 ? TextDirection.ltr
//                 : TextDirection.rtl,
//             child: AlertDialog(
//               contentPadding: EdgeInsets.all(3),
//               elevation: 0,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(16))),
//               backgroundColor: Colors.transparent,
//               content: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(16)),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 18, vertical: 24),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           Text(
//                             title,
//                             style: MyColors.styleBoldBlue,
//                             textAlign: TextAlign.center,
//                           ),
//                           SizedBox(
//                             height: 8,
//                           ),
//                           Row(
//                             children: [
//                               Flexible(
//                                 child: Text(
//                                   text,
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 14,
//                                       fontFamily: "IBM Plex Arabic",
//                                       fontWeight: FontWeight.w400),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 13,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               Flexible(
//                                 child: SpecialButton(
//                                   onTap: rightButtonFunction,
//                                   text: rightButtonText,
//                                   color: rightButtonColor ?? Colors.green,
//                                   radius: 24.0,
//                                   paddingHorizontal: 5,
//                                   textColor: Colors.white,
//                                 ),
//                               ),
//                               SizedBox(width: 8),
//                               Flexible(
//                                 child: SpecialButton(
//                                   onTap: leftButtonFunction,
//                                   text: leftButtonText,
//                                   color: leftButtonColor ?? Colors.green,
//                                   paddingHorizontal: 5,
//                                   radius: 24.0,
//                                   textColor: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     )),
//               ),
//             ),
//           );
//         });
//   }
//
//   showPic(String imageUrl) {
//     showDialog(
//         barrierDismissible: false,
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             contentPadding: EdgeInsets.all(0),
//             elevation: 0,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(10))),
//             backgroundColor: Colors.transparent,
//             content: Container(
// //                height: 150,
//                 decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: <Widget>[
//                           Material(
//                             color: Colors.transparent,
//                             child: InkWell(
//                                 onTap: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: Icon(
//                                   Icons.cancel,
//                                   color: Colors.red,
//                                   size: 27,
//                                 )),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       CachedNetworkImage(
//                         fit: BoxFit.cover,
//                         imageUrl: "$imageUrl",
//                         placeholder: (context, url) => new Container(
//                           height: 50,
//                           color: Colors.black,
//                           child: Center(child: CircularProgressIndicator()),
//                         ),
//                         errorWidget: (context, url, error) =>
//                             new Icon(Icons.error),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                     ],
//                   ),
//                 )),
//           );
//         });
//   }
//
//   showAlert(String text) {
//     showDialog(
//         barrierDismissible: true,
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             contentPadding: EdgeInsets.all(0),
//             elevation: 0,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(10))),
//             backgroundColor: Colors.transparent,
//             content: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
//                   child: Text(
//                     text ?? localization.text("no_internet"),
//                     style: MyColors.styleBold2white,
//                     textAlign: TextAlign.center,
//                   ),
//                 )),
//           );
//         });
//   }
//
//   showSnackBar(msg) {
//     scaffold.currentState.showSnackBar(
//       SnackBar(
//         content: Text(
//           msg,
//           style: MyColors.styleBold1white,
//           textAlign: TextAlign.center,
//         ),
//         backgroundColor: Colors.black,
//         duration: Duration(seconds: 3),
//       ),
//     );
//   }
//
//   showSnackBarTwoSeconds(msg) {
//     scaffold.currentState.showSnackBar(
//       SnackBar(
//         content: Text(
//           msg,
//           style: MyColors.styleBold1white,
//           textAlign: TextAlign.center,
//         ),
//         backgroundColor: Colors.black,
//         duration: Duration(seconds: 2),
//       ),
//     );
//   }
//
//   // ScaffoldFeatureController _bottomSheet;
//
//   showBottomSheetOfBuyingNewCard({withAppBar, onChange}) {
//     scaffold.currentState.showBottomSheet((_) {
//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8),
//         child: Material(
// //            color: Colors.white,
//           borderRadius: BorderRadius.only(
//               topRight: Radius.circular(15), topLeft: Radius.circular(15)),
//           elevation: 15,
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height - 120,
//             decoration: BoxDecoration(
//                 color: Color(0xffFAFAFA),
//                 borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(15),
//                     topLeft: Radius.circular(15))),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: 7,
//                     width: 60,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(30)),
//                         color: Colors.grey[400]),
//                   ),
//                 ),
//                 Expanded(
//                   child: CustomWidgetBody(
//                     service: CardAdvantagesCubit.get(context)
//                         .getCardsAdvantages(context: context),
// //                    height: MediaQuery.of(context).size.height * .5,
//                     body: BlocBuilder<CardAdvantagesCubit, CardAdvantagesState>(
//                         builder: (context, state) {
//                       var cubit = CardAdvantagesCubit.get(context);
//                       return Padding(
//                         padding: EdgeInsets.only(top: 10, right: 20, left: 20),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: <Widget>[
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Flexible(
//                                   child: Text(
//                                     localization
//                                         .text("New card subscription features"),
//                                     style: MyColors.styleBold1,
//                                     textAlign: TextAlign.start,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 3,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Flexible(
//                                   child: Text(
//                                     localization.text(
//                                         "By subscribing to a new card, you will get the following features:"),
//                                     style: MyColors.styleSmallHint,
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 8,
//                             ),
//
//                             (state is CardAdvantagesLoadingState)
//                                 ? AppLoader(
//                                     // height:
//                                     // MediaQuery.of(context).size.height * .5,
//                                     )
//                                 : (state is CardAdvantagesErrorState)
//                                     ? AppError(
//                                         // height:
//                                         // MediaQuery.of(context).size.height *
//                                         //     .5,
//                                         text: state.error,
//                                       )
//                                     : Expanded(
// //                                height: 100,
//                                         child: RefreshIndicator(
//                                           onRefresh: () async {
//                                             return CardAdvantagesCubit.get(
//                                                     context)
//                                                 .getCardsAdvantages(
//                                                     context: context);
//                                           },
//                                           child: GridView.count(
//                                             primary: false,
//                                             shrinkWrap: true,
//                                             physics:
//                                                 AlwaysScrollableScrollPhysics(),
//                                             padding: const EdgeInsets.all(5),
//                                             crossAxisSpacing: 10,
//                                             childAspectRatio: (6 / 7),
//                                             mainAxisSpacing: 5,
//                                             crossAxisCount: 2,
//                                             children: List.generate(
//                                                 cubit.cardAdvantagesModel ==
//                                                         null
//                                                     ? 0
//                                                     : cubit.cardAdvantagesModel
//                                                         .data.length, (index) {
//                                               return AnimatedSpecialWidget(
//                                                 child: (i) => InkWell(
//                                                   onTap: () {
//                                                     LoadingDialog(
//                                                             scaffold, context)
//                                                         .showQRCodeNew(
//                                                             context: context,
//                                                             link: cubit
//                                                                 .cardAdvantagesModel
//                                                                 .data[index]
//                                                                 .phone,
//                                                             name: cubit
//                                                                 .cardAdvantagesModel
//                                                                 .data[index]
//                                                                 .name,
//                                                             imageUrl: cubit
//                                                                 .cardAdvantagesModel
//                                                                 .data[index]
//                                                                 .image,
//                                                             description: cubit
//                                                                 .cardAdvantagesModel
//                                                                 .data[index]
//                                                                 .description);
//                                                   },
//                                                   child: BusinessCardTutorial(
//                                                     txt: cubit
//                                                         .cardAdvantagesModel
//                                                         .data[index]
//                                                         .description,
//                                                     image: cubit
//                                                         .cardAdvantagesModel
//                                                         .data[index]
//                                                         .image,
//                                                   ),
//                                                 ),
//                                                 index: index,
//                                               );
//                                             }),
//                                           ),
//                                         ),
//                                       ),
// //                              ),
//
//                             SizedBox(
//                               height: 15,
//                             ),
//                             Material(
//                               color: Colors.white,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(30)),
//                               elevation: 5,
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(30))),
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 6, vertical: 4),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       Container(
//                                         height: 16,
//                                         width: 16,
//                                         child: SvgPicture.asset(
//                                             "assets/icon/clock.svg"),
//                                       ),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       Flexible(
//                                         child: Text(
//                                           localization.text(
//                                               "Subscription period: 365 days"),
//                                           style: MyColors.styleNormal0,
//                                           textAlign: TextAlign.start,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 9,
//                             ),
//
//                             (state is CardAdvantagesLoadingState)
//                                 ? CustomCircularLoading()
//                                 : cubit.cardAdvantagesModel == null
//                                     ? Container()
//                                     : cubit.cardAdvantagesModel.data == null
//                                 ? Container()
//                                 : cubit.cardAdvantagesModel.data.length == 0
//                                         ? Container()
//                                         : Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.end,
//                                             children: [
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.center,
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.end,
//                                                 children: [
//                                                   Text(
//                                                     "SR",
//                                                     style:
//                                                         MyColors.styleBoldSmal2,
//                                                   ),
//                                                   SizedBox(
//                                                     width: 3,
//                                                   ),
//                                                   Text(
//                                                     "${cubit.cardAdvantagesModel.data[0].priceAfterDiscount}",
//                                                     style: TextStyle(
//                                                         color: Colors.black,
//                                                         fontSize: 32,
//                                                         // fontFamily: "Tajawal",
//                                                         fontWeight:
//                                                             FontWeight.normal),
//                                                   ),
//                                                 ],
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               ),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.center,
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.end,
//                                                 children: [
//                                                   Text(
//                                                     "SR",
//                                                     style:
//                                                         MyColors.styleBoldSmal2,
//                                                   ),
//                                                   SizedBox(
//                                                     width: 3,
//                                                   ),
//                                                   Text(
//                                                     "${cubit.cardAdvantagesModel.data[0].price}",
//                                                     style: TextStyle(
//                                                         color:
//                                                             MyColors.blueBlack3,
//                                                         fontSize: 18,
//                                                         fontFamily:
//                                                             "IBM Plex Arabic",
//                                                         fontWeight:
//                                                             FontWeight.w700,
//                                                         decoration:
//                                                             TextDecoration
//                                                                 .lineThrough),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                             SizedBox(
//                               height: 12,
//                             ),
//                             SpecialButton(
//                               text: localization.text("subscribe now"),
//                               height: 50.0,
//                               onTap: () {
//                                 chooseFatooraWayToBuyCard(context);
//                               },
//                               color: MyColors.lightBlue,
//                               radius: 24.0,
//                               icon: ClipRRect(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(50)),
//                                 child: Container(
//                                   height: 22,
//                                   width: 22,
//                                   color: Colors.white.withOpacity(.4),
//                                   child: Center(
//                                     child: Icon(
//                                       Icons.check,
//                                       color: Colors.white,
//                                       size: 15,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     }),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 80,
//                 ),
//                 Platform.isIOS ? SizedBox(height: 20,) :Container()
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }
//
//   showBottomSheetToChooseCategory(
//       {bool addingFromNearScreen, int subscriptionId,bool addBottomHeight, var refresh}) {
//     scaffold.currentState.showBottomSheet((_) {
//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8),
//         child: Material(
// //            color: Colors.white,
//           borderRadius: BorderRadius.only(
//               topRight: Radius.circular(15), topLeft: Radius.circular(15)),
//           elevation: 15,
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height - 140,
//             decoration: BoxDecoration(
//                 color: Color(0xffFAFAFA),
//                 borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(15),
//                     topLeft: Radius.circular(15))),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: 7,
//                     width: 60,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(30)),
//                         color: Colors.grey[400]),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 12,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Flexible(
//                       child: Text(
//                         localization.text("choose_wallet"),
//                         style: MyColors.styleBold1,
//                         textAlign: TextAlign.start,
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 Expanded(
//                   child: CustomWidgetBody(
//                     service: MyCategoriesCubit.get(context)
//                         .getMyCategories(context: context),
// //                    height: MediaQuery.of(context).size.height * .5,
//                     body: BlocBuilder<MyCategoriesCubit, MyCategoriesState>(
//                       builder: (context, state) {
//                         var cubit = MyCategoriesCubit.get(context);
//                         return Padding(
//                           padding: EdgeInsets.only(top: 25),
//                           child: RefreshIndicator(
//                             color: MyColors.blueBlack2,
//                             onRefresh: () async {
//                               cubit.getMyCategories(context: context);
//                             },
//                             child: Column(
//                               children: [
//                                 Expanded(
//                                   child: ListView(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 20),
//                                     children: <Widget>[
//                                       (state is MyCategoriesLoadingState)
//                                           ? AppLoader(
//                                               height: MediaQuery.of(context)
//                                                       .size
//                                                       .height *
//                                                   .5,
//                                             )
//                                           : (state is MyCategoriesErrorState)
//                                               ? AppError(
//                                                   height: MediaQuery.of(context)
//                                                           .size
//                                                           .height *
//                                                       .5,
//                                                   text: state.error,
//                                                 )
//                                               : Column(
//                                                   children: [
//                                                     SizedBox(
//                                                       height: 10,
//                                                     ),
//                                                     ListAnimator(
//                                                       physics: false,
//                                                       child: (index) {
//                                                         return InkWell(
//                                                           onTap:
//                                                               addingFromNearScreen !=
//                                                                       null
//                                                                   ? () {
//                                                                       showToast(
//                                                                           msg: localization.text(
//                                                                               "please wait"),
//                                                                           state: ToastStates
//                                                                               .WARNING,
//                                                                           shortTime:
//                                                                               true);
//                                                                       Navigator.pop(
//                                                                           context);
//
//                                                                       AddCardToMyFavCubit.get(context).setCategoryId(
//                                                                         data: cubit
//                                                                             .everyCategory[index],
//                                                                           valueName: cubit
//                                                                               .everyCategory[index].name,
//                                                                           valueId: cubit
//                                                                               .everyCategory[index]
//                                                                               .id);
//
//                                                                       AddCardToMyFavCubit.get(
//                                                                               context)
//                                                                           .addCardToMyWallet(
//                                                                         context:
//                                                                             context,
//                                                                         refresh: refresh,
//                                                                         subscriptionId:
//                                                                             subscriptionId,
//                                                                         dataOfCategory:
//                                                                             cubit.everyCategory[index],
//                                                                       );
//                                                                     }
//                                                                   : () {
//                                                                       AddCardToMyFavCubit.get(context).setCategoryId(
//                                                                           data: cubit
//                                                                               .everyCategory[index],
//                                                                           valueName: cubit
//                                                                               .everyCategory[index].name,
//                                                                           valueId: cubit
//                                                                               .everyCategory[index]
//                                                                               .id);
//
//                                                                       // refresh();
//
//                                                                       Navigator.pop(
//                                                                           context);
//                                                                     },
//                                                           child:
//                                                               CustomGroupOfCards(
//                                                             data: cubit
//                                                                     .everyCategory[
//                                                                 index],
//                                                           ),
//                                                         );
//                                                       },
//                                                       data: cubit.everyCategory,
//                                                     ),
//                                                     SizedBox(
//                                                       height: 10,
//                                                     ),
//                                                   ],
//                                                 ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 addBottomHeight == null ? Container() :
//                     SizedBox(height: 70,)
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }
//
//   showBottomSheetToChooseExchangeCard(
//       {int userId,
//       int indexOfTappedCard,
//       String userName,
//       int clientExchangeId}) {
//     scaffold.currentState.showBottomSheet((_) {
//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8),
//         child: Material(
// //            color: Colors.white,
//           borderRadius: BorderRadius.only(
//               topRight: Radius.circular(15), topLeft: Radius.circular(15)),
//           elevation: 15,
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height - 140,
//             decoration: BoxDecoration(
//                 color: Color(0xffFAFAFA),
//                 borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(15),
//                     topLeft: Radius.circular(15))),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: 7,
//                     width: 60,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(30)),
//                         color: Colors.grey[400]),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 12,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Flexible(
//                       child: Text(
//                         localization.text("Exchange Card"),
//                         style: MyColors.styleBold1,
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Flexible(
//                       child: Text(
//                         "${localization.text("Please choose a card to send to")} $userName",
//                         style: MyColors.styleSmallHint,
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Expanded(
//                   child: CustomWidgetBody(
//                     service: UserCardsCubit.get(context)
//                         .getMyBusinessCards(context: context),
// //                    height: MediaQuery.of(context).size.height * .5,
//                     body: BlocBuilder<UserCardsCubit, UserCardsState>(
//                       builder: (context, state) {
//                         var cubit = UserCardsCubit.get(context);
//                         return Padding(
//                           padding: EdgeInsets.only(top: 20),
//                           child: RefreshIndicator(
//                             color: MyColors.blueBlack2,
//                             onRefresh: () async {
//                               cubit.getMyBusinessCards(context: context);
//                             },
//                             child: Column(
//                               children: [
//                                 Expanded(
//                                   child: ListView(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 20),
//                                     children: <Widget>[
//                                       (state is UserCardsLoadingState)
//                                           ? AppLoader(
//                                               height: MediaQuery.of(context)
//                                                       .size
//                                                       .height *
//                                                   .5,
//                                             )
//                                           : (state is UserCardsErrorState)
//                                               ? AppError(
//                                                   height: MediaQuery.of(context)
//                                                           .size
//                                                           .height *
//                                                       .5,
//                                                   text: state.error,
//                                                 )
//                                               : Column(
//                                                   children: [
//                                                     SizedBox(
//                                                       height: 10,
//                                                     ),
//                                                     ListAnimator(
//                                                       physics: false,
//                                                       child: (index) {
//                                                         return InkWell(
//                                                           onTap: () {
//                                                             if (cubit
//                                                                     .usedFavCards[
//                                                                         index]
//                                                                     .expiredCard ==
//                                                                 "0") {
//                                                               showToast(
//                                                                   msg: localization
//                                                                       .text(
//                                                                           "Payment not confirmed"),
//                                                                   state:
//                                                                       ToastStates
//                                                                           .ERROR);
//                                                             } else if (cubit
//                                                                     .usedFavCards[
//                                                                         index]
//                                                                     .expiredCard ==
//                                                                 "2") {
//                                                               showToast(
//                                                                   msg: localization
//                                                                       .text(
//                                                                           "Subscription period has expired"),
//                                                                   state:
//                                                                       ToastStates
//                                                                           .ERROR);
//                                                             } else {
//                                                               Navigator.pop(
//                                                                   context);
//
//                                                               ExchangeCardCubit.get(context).exchangeYourCardWithAnotherUser(
//                                                                   context:
//                                                                       context,
//                                                                   userId:
//                                                                       userId,
//                                                                   clientExchangeId:
//                                                                       clientExchangeId,
//                                                                   index:
//                                                                       indexOfTappedCard,
//                                                                   subscriptionId: cubit
//                                                                       .usedFavCards[
//                                                                           index]
//                                                                       .id);
//                                                             }
//                                                           },
//                                                           child:
//                                                               MyExpandedCardForExchangeCustom(
//                                                             data: cubit
//                                                                     .usedFavCards[
//                                                                 index],
//                                                             index: index,
//                                                             scaffold: scaffold,
//                                                           ),
//                                                         );
//                                                       },
//                                                       data: cubit.usedFavCards,
//                                                     ),
//                                                     SizedBox(
//                                                       height: 10,
//                                                     ),
//                                                   ],
//                                                 ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }
//
//   showBottomSheetCardDetails({
//     int cardId,
//     bool exchangeNotificationType,
//   }) {
//     scaffold.currentState.showBottomSheet((_) {
//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8),
//         child: Material(
// //            color: Colors.white,
//           borderRadius: BorderRadius.only(
//               topRight: Radius.circular(15), topLeft: Radius.circular(15)),
//           elevation: 15,
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height - 140,
//             decoration: BoxDecoration(
//                 color: Color(0xffFAFAFA),
//                 borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(15),
//                     topLeft: Radius.circular(15))),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: 7,
//                     width: 60,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(30)),
//                         color: Colors.grey[400]),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 12,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Flexible(
//                       child: Text(
//                         localization.text("card details"),
//                         style: MyColors.styleBold1,
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Expanded(
//                   child: CustomWidgetBody(
//                     service: BusinessCardByIdCubit.get(context)
//                         .getBusinessCardById(context: context, id: cardId),
// //                    height: MediaQuery.of(context).size.height * .5,
//                     body: BlocBuilder<BusinessCardByIdCubit,
//                         BusinessCardByIdState>(
//                       builder: (context, state) {
//                         var cubit = BusinessCardByIdCubit.get(context);
//                         return Padding(
//                           padding: EdgeInsets.only(top: 20),
//                           child: RefreshIndicator(
//                             color: MyColors.blueBlack2,
//                             onRefresh: () async {
//                               cubit.getBusinessCardById(
//                                   context: context, id: cardId);
//                             },
//                             child: Column(
//                               children: [
//                                 Expanded(
//                                   child: ListView(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 20),
//                                     children: <Widget>[
//                                       (state is BusinessCardByIdLoadingState)
//                                           ? AppLoader(
//                                               height: MediaQuery.of(context)
//                                                       .size
//                                                       .height *
//                                                   .5,
//                                             )
//                                           : (state
//                                                   is BusinessCardByIdErrorState)
//                                               ? AppError(
//                                                   height: MediaQuery.of(context)
//                                                           .size
//                                                           .height *
//                                                       .5,
//                                                   text: state.error,
//                                                 )
//                                               : Column(
//                                                   children: [
//                                                     AnimationLimiter(
//                                                       child: Column(
//                                                         children:
//                                                             AnimationConfiguration
//                                                                 .toStaggeredList(
//                                                           duration:
//                                                               const Duration(
//                                                                   milliseconds:
//                                                                       375),
//                                                           childAnimationBuilder:
//                                                               (widget) =>
//                                                                   SlideAnimation(
//                                                             horizontalOffset:
//                                                                 50.0,
//                                                             child:
//                                                                 FadeInAnimation(
//                                                               child: widget,
//                                                             ),
//                                                           ),
//                                                           children: [
//                                                             SizedBox(
//                                                               height: 10,
//                                                             ),
//                                                             SlideAnimation(
//                                                               duration: Duration(
//                                                                   milliseconds:
//                                                                       250),
//                                                               verticalOffset:
//                                                                   50.0,
//                                                               horizontalOffset:
//                                                                   50.0,
//                                                               child:
//                                                                   FadeInAnimation(
//                                                                 child:
//                                                                     ExpandedCardFromNotificationCustom(
//                                                                   data: cubit
//                                                                       .model
//                                                                       .data,
//                                                                   refresh: () {
//                                                                     cubit.getBusinessCardById(
//                                                                         context:
//                                                                             context,
//                                                                         id: cardId);
//                                                                   },
//                                                                   scaffold:
//                                                                       scaffold,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             SizedBox(
//                                                               height: 10,
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }
//
//   chooseFatooraWayToBuyCard(BuildContext context) {
//     return showModalBottomSheet<dynamic>(
//         isScrollControlled: true,
//         backgroundColor: Colors.white,
//         context: context,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(20), topLeft: Radius.circular(20))),
//         builder: (BuildContext bc) {
//           return Padding(
//             padding: MediaQuery.of(context).viewInsets,
//             child: Directionality(
//               textDirection: localization.currentLanguage.toString() == "en"
//                   ? TextDirection.ltr
//                   : TextDirection.rtl,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 20.0),
//                 child:
//                     Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
//                   ListTile(
//                       onTap: () {},
//                       title: Center(
//                         child: Text(
//                           localization.text("_online_Payment"),
//                           textAlign: TextAlign.center,
//                           style: MyColors.styleBold1,
//                         ),
//                       )),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: SpecialButton(
//                       onTap: () {
//                         Navigator.pop(context);
//
//                         Provider.of<PayValueOfBusinessCardProvider>(context,
//                                 listen: false)
//                             .buyBusinessCard(context, 2, scaffold);
//                       },
//                       text: localization.text("pay with visa"),
//                     ),
//                   ),
// //                  SizedBox(
// //                    height: 8,
// //                  ),
//                   Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: SpecialButton(
//                       onTap: () {
//                         Navigator.pop(context);
//
//                         Provider.of<PayValueOfBusinessCardProvider>(context,
//                                 listen: false)
//                             .buyBusinessCard(context, 1, scaffold);
//                       },
//                       text: localization.text("pay by mada"),
//                     ),
//                   ),
//
//                   Platform.isIOS == true
//                       ? Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: SpecialButton(
//                             onTap: () {
//                               Navigator.pop(context);
//
//                               Provider.of<PayValueOfBusinessCardProvider>(
//                                       context,
//                                       listen: false)
//                                   .buyBusinessCard(context, 3, scaffold);
//                             },
//                             text: localization.text("apple pay"),
//                           ),
//                         )
//                       : Container(),
//
//                   SizedBox(
//                     height: 8,
//                   ),
//                   SizedBox(
//                     height: 20,
//                   )
//                 ]),
//               ),
//             ),
//           );
//         });
//   }
//
//   chooseFatooraWayToRenewSubscription(id) {
//     return showModalBottomSheet<dynamic>(
//         isScrollControlled: true,
//         backgroundColor: Colors.white,
//         context: context,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(20), topLeft: Radius.circular(20))),
//         builder: (BuildContext bc) {
//           return Padding(
//             padding: MediaQuery.of(context).viewInsets,
//             child: Directionality(
//               textDirection: localization.currentLanguage.toString() == "en"
//                   ? TextDirection.ltr
//                   : TextDirection.rtl,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 20.0),
//                 child:
//                     Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
//                   ListTile(
//                       onTap: () {},
//                       title: Center(
//                         child: Text(
//                           localization.text("_online_Payment"),
//                           textAlign: TextAlign.center,
//                           style: MyColors.styleBold1,
//                         ),
//                       )),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: SpecialButton(
//                       onTap: () {
//                         Navigator.pop(context);
//
//                         Provider.of<RenuSubscriptionForCardProvider>(context,
//                                 listen: false)
//                             .buyBusinessCard(context, 2, id, scaffold);
//                       },
//                       text: localization.text("pay with visa"),
//                       radius: 24.0,
//                       color: MyColors.blueBlack2,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: SpecialButton(
//                       onTap: () {
//                         Navigator.pop(context);
//
//                         Provider.of<RenuSubscriptionForCardProvider>(context,
//                                 listen: false)
//                             .buyBusinessCard(context, 1, id, scaffold);
//                       },
//                       text: localization.text("pay by mada"),
//                       radius: 24.0,
//                       color: MyColors.blueBlack2,
//                     ),
//                   ),
//                   Platform.isIOS == true
//                       ? Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: SpecialButton(
//                             onTap: () {
//                               Navigator.pop(context);
//
//                               Provider.of<RenuSubscriptionForCardProvider>(
//                                       context,
//                                       listen: false)
//                                   .buyBusinessCard(context, 3, id, scaffold);
//                             },
//                             text: localization.text("apple pay"),
//                             radius: 24.0,
//                             color: MyColors.blueBlack2,
//                           ),
//                         )
//                       : Container(),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   SizedBox(
//                     height: 20,
//                   )
//                 ]),
//               ),
//             ),
//           );
//         });
//   }
// }
