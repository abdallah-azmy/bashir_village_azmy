import 'package:bashir_village/src/General%20Cubit/FavouriteNewsCubit/fav_News_cubit.dart';
import 'package:bashir_village/src/UI/MainWidgets/app_error.dart';
import 'package:bashir_village/src/UI/MainWidgets/customCard.dart';
import 'package:bashir_village/src/UI/MainWidgets/customLinearLoading.dart';
import 'package:bashir_village/src/UI/MainWidgets/list_animator.dart';
import 'package:bashir_village/src/UI/SupScreens/News/newsDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FavScreen extends StatefulWidget {
  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  void initState() {
    super.initState();
    FavNewsCubit.get(context).getFavNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("المفضلة"),
          centerTitle: true,
          leading: InkWell(
            child: Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.pop(context),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return FavNewsCubit.get(context).getFavNews();
          },
          child: BlocBuilder<FavNewsCubit, FavNewsState>(
            builder: (context, state) {
              var cubit = FavNewsCubit.get(context);
              return (state is FavNewsLoadingState)
                  ? Center(
                child: SpinKitThreeBounce(
                  size: 25,
                  color: Theme.of(context).primaryColor,
                ),
              )
                  : (state is FavNewsErrorState)
                  ? AppError(
                height: MediaQuery.of(context).size.height * .7,
                text: state.error,
              )
                  : cubit.model.data == null
                      ? Center(
                          child: Text("لا يوجد اخبار مفضلة"),
                        )
                      : Padding(
                padding: const EdgeInsets.only(right: 10, left: 10,top: 10),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListAnimator(
                                data: cubit.model.data,
                                child: (index) {
                                  return cubit.indexOfDeletedFav == index
                                      ? Center(
                                    child: CustomLinearLoading(),
                                  )
                                      : Dismissible(
                                      key: ValueKey(index),
                                      background: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color: Theme.of(context).errorColor,
                                        ),
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                        alignment: Alignment.centerRight,
                                        padding: EdgeInsets.only(right: 20),
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 4,
                                        ),
                                      ),
                                      direction: DismissDirection.endToStart,
                                      confirmDismiss: (direction) {
                                        return showDialog(
                                          context: context,
                                          builder: (ctx) => Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: AlertDialog(
                                              title: Text('هل انت متاكد ؟'),
                                              content: Text(
                                                'هل تريد حذف الاشعار ؟',
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: Text('لا'),
                                                  onPressed: () {
                                                    Navigator.of(ctx)
                                                        .pop(false);
                                                  },
                                                ),
                                                TextButton(
                                                  child: Text('نعم'),
                                                  onPressed: () {
                                                    Navigator.of(ctx)
                                                        .pop(true);
                                                    // _saveForm(index);
                                                    cubit.deleteFavNews(
                                                        index: index,
                                                        favId: cubit.model
                                                            .data[index].id);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      onDismissed: (direction) {
                                        //  Provider.of<Cart>(context, listen: false).removeItem(productId);
                                      },
                                      child: CustomCard(
                                        // createdAt: DateTime.now(),
                                        // image: "",
                                        // numcomment: 0,
                                        // seen: 1,
                                        // title: "",
                                        fav: true,
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
                                        },
                                      ));
                                },

                              ),
                            ),
                          ],
                        ),
                      );
            },
          ),
        ));
  }
}
