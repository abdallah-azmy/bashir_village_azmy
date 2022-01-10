import 'package:bashir_village/src/General%20Cubit/NotificationsCubit/notifications_cubit.dart';
import 'package:bashir_village/src/UI/Basics/Register/Login/login.dart';
import 'package:bashir_village/src/UI/MainWidgets/app_error.dart';
import 'package:bashir_village/src/UI/MainWidgets/customBtn.dart';
import 'package:bashir_village/src/UI/MainWidgets/list_animator.dart';
import 'package:bashir_village/src/UI/Notifications/Widgets/notificationsCard.dart';
import 'package:bashir_village/src/network/cachHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:intl/intl.dart' as intl;

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  void initState() {
    super.initState();
    if (CacheHelper.getData(key: 'token') != null) {
      NotificationsCubit.get(context).getNotifications();
    }

    // _getShared();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('الإشعارات'),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        backgroundColor: Color.fromRGBO(242, 242, 242, 1),
        body: RefreshIndicator(
          onRefresh: (){
            return NotificationsCubit.get(context).getNotifications();
          },
          child: BlocBuilder<NotificationsCubit, NotificationsState>(
            builder: (context, state) {
              var cubit = NotificationsCubit.get(context);
              return CacheHelper.getData(key: 'token') == null
                  ? Center(
                      child: CustomBtn(
                          text: 'تسجيل الدخول',
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => LoginPage()));
                          },
                          color: Theme.of(context).primaryColor),
                    )
                  :  (state is NotificationsLoadingState)
                          ? Center(
                              child: SpinKitThreeBounce(
                                size: 25,
                                color: Theme.of(context).primaryColor,
                              ),
                            )

                      : (state is NotificationsErrorState)
                          ? AppError(
                              height: MediaQuery.of(context).size.height * .7,
                              text: state.error,
                            )
                          : Padding(
                              padding: const EdgeInsets.only(right: 10, left: 10,top: 10),
                              child: Column(
                                children: <Widget>[

                                  Expanded(
                                    child: ListAnimator(
                                      data: cubit.notifications,
                                      child: (index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Dismissible(
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
                                                          Navigator.of(ctx).pop(true);
                                                          // _saveForm(index);
                                                          cubit.deleteNotification(
                                                              index: index,
                                                              notificationId: cubit
                                                                  .notifications[
                                                              index]
                                                                  .id);
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
                                            child: NotificationsCard(
                                              date:
                                              "${intl.DateFormat.d().format(cubit.notifications[0].createdAt)}/${intl.DateFormat.M().format(cubit.notifications[0].createdAt)}/${intl.DateFormat.y().format(cubit.notifications[0].createdAt)}",
                                              label: cubit.notifications[index].title,
                                              msg: cubit.notifications[index].message,
                                              id: cubit.notifications[index].newsId,
                                              type: cubit.notifications[index].type,
                                            ),
                                          ),
                                        );
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
