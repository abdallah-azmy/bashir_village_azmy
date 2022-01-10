import 'package:bashir_village/src/General%20Cubit/CommentsCubit/comments_cubit.dart';
import 'package:bashir_village/src/UI/Basics/Register/Login/login.dart';
import 'package:bashir_village/src/UI/MainWidgets/app_error.dart';
import 'package:bashir_village/src/UI/MainWidgets/commentCard.dart';
import 'package:bashir_village/src/UI/MainWidgets/customBtn.dart';
import 'package:bashir_village/src/UI/MainWidgets/customCircularLoading.dart';
import 'package:bashir_village/src/UI/MainWidgets/list_animator.dart';
import 'package:bashir_village/src/network/cachHelper.dart';
import 'package:bashir_village/src/provider/addCommenProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

class AddComment extends StatefulWidget {
  final List comments;
  final int newsId;

  const AddComment({Key key, this.comments, this.newsId}) : super(key: key);

  @override
  _AddCommentState createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
 

  @override
  void initState() {
    CommentsCubit.get(context).getComments(id: widget.newsId);
    super.initState();
  }


  String comment;
  String token;
  // bool _load = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("التعليقات"),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context, true);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body:

      RefreshIndicator(
        onRefresh: () {
          return CommentsCubit.get(context).getComments(id: widget.newsId);
        },
        child: BlocBuilder<CommentsCubit, CommentsState>(
          builder: (context, state) {
            var cubit = CommentsCubit.get(context);
            return Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child:
              CacheHelper.getData(key: 'token') == null
                  ? Center(
                child: CustomBtn(
                    text: 'تسجيل الدخول',
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => LoginPage()));
                    },
                    color: Theme.of(context).primaryColor),
              )
                  :
              (state is CommentsLoadingState)
                  ? Center(
                child: SpinKitThreeBounce(
                  size: 25,
                  color: Theme.of(context).primaryColor,
                ),
              )
                  : (state is CommentsErrorState)
                  ? AppError(
                height: MediaQuery.of(context).size.height * .7,
                text: state.error,
              )
                  :   Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: ListAnimator(
                        data: cubit.comments,
                        child: (index) {
                          return CommentCard(
                            index: index,
                            comment: cubit.comments[index].comment,
                            name: cubit.comments[index].user,
                            data: intl.DateFormat.yMd()
                                .format(cubit.comments[index].createdAt),
                            img: cubit.comments[index].userPhoto,
                          );
                        },

                      ),
                    ),
                    // Flexible(
                    //   child: ListView.builder(
                    //     physics: ScrollPhysics(),
                    //     shrinkWrap: true,
                    //     itemCount: cubit.comments == null ? 0 : cubit.comments.length,
                    //     itemBuilder: (BuildContext context, int index) {
                    //       return CommentCard(
                    //         index: index,
                    //         comment: cubit.comments[index].comment,
                    //         name: cubit.comments[index].user,
                    //         data: intl.DateFormat.yMd()
                    //             .format(cubit.comments[index].createdAt),
                    //         img: cubit.comments[index].userPhoto,
                    //       );
                    //     },
                    //   ),
                    // ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Directionality(
                              //   textDirection: p.TextDirection.rtl,
                              textDirection: TextDirection.rtl,
                              child: TextField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  maxLength: 200,
                                  decoration: InputDecoration.collapsed(
                                      hintText: "التعليق"),
                                  onChanged: (value) {
                                    setState(() {
                                      comment = value;
                                    });
                                    cubit.comment = value ;
                                  }),
                            ),
                          ),
                        (state is AddCommentLoadingState)
                              ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomCircularLoading()
                          )
                              : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 10,
                              child: InkWell(
                                onTap: () {
                                  cubit.addComment(id: widget.newsId);
                                  // _saveForm();
                                },
                                child: Text(
                                  "ارسال",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                          // IconButton(
                          //   icon: Icon(
                          //     Icons.send,
                          //     color: Theme.of(context).primaryColor,
                          //   ),
                          //   onPressed: () {
                          //  print("${comment}.................");
                          //      print("${widget.newsId}.................");
                          //     _saveForm();

                          //   },
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      )
      
      
    
    
    
    );
  }

  // _saveForm() {
  //   Provider.of<AddCommentProvider>(context, listen: false)
  //       .addComment(token, comment, widget.newsId)
  //       .then((res) {
  //     setState(() {
  //       _load = false;
  //       comment = null;
  //     });
  //     switch (res.code) {
  //       case 200:
  //         print("done");
  //         setState(() {
  //           _model = null;
  //         });
  //         _getShared();
  //         break;
  //       case 400:
  //         print("data don't match");
  //         showDialog(
  //             context: context,
  //             builder: (BuildContext context) {
  //               return SimpleDialog(
  //                 shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(10)),
  //                 backgroundColor: Colors.white,
  //                 elevation: 3,
  //                 contentPadding: EdgeInsets.all(5),
  //                 children: <Widget>[
  //                   Text(
  //                     res.error[0].value,
  //                     textAlign: TextAlign.center,
  //                     style: TextStyle(color: Colors.black, fontSize: 20),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
  //                     child: MaterialButton(
  //                       onPressed: () {
  //                         Navigator.pop(context);
  //                       },
  //                       elevation: 3,
  //                       height: 45,
  //                       color: Theme.of(context).primaryColor,
  //                       shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(5)),
  //                       child: Text(
  //                         'موافق',
  //                         style: TextStyle(fontSize: 17, color: Colors.white),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               );
  //             });
  //         break;
  //       case 422:
  //         print(res.error[0].value);
  //         setState(() {
  //           //  _load = false;
  //         });
  //         break;
  //       default:
  //         setState(() {
  //           //_load = false;
  //         });
  //         print('error data');
  //         showDialog(
  //             context: context,
  //             builder: (BuildContext context) {
  //               return SimpleDialog(
  //                 shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(10)),
  //                 backgroundColor: Colors.white,
  //                 elevation: 3,
  //                 contentPadding: EdgeInsets.all(5),
  //                 children: <Widget>[
  //                   Text(
  //                     'من فضلك ادخل البيانات بشكل صحيح',
  //                     textAlign: TextAlign.center,
  //                     style: TextStyle(color: Colors.black, fontSize: 20),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
  //                     child: MaterialButton(
  //                       onPressed: () {
  //                         Navigator.pop(context);
  //                       },
  //                       elevation: 3,
  //                       height: 45,
  //                       color: Theme.of(context).primaryColor,
  //                       shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(5)),
  //                       child: Text(
  //                         'موافق',
  //                         style: TextStyle(fontSize: 17, color: Colors.white),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               );
  //             });
  //     }
  //   });
  // }
}
