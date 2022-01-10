import 'package:bashir_village/src/Helpers/consts.dart';
import 'package:bashir_village/src/UI/MainWidgets/toast.dart';
import 'package:bashir_village/src/models/deletNotificationModel.dart';
import 'package:bashir_village/src/models/notificationModel.dart';
import 'package:bashir_village/src/network/azmyNetworkUtlis.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
// import 'package:easycard/src/General%20Cubit/NewNotificationsCubit/new_notifications_cubit.dart';
// import 'package:easycard/src/MainWidgets/toast.dart';
// import 'package:easycard/src/Models/get/notificationModel.dart';
// import 'package:easycard/src/Models/post/acceptExchangeModel.dart';
// import 'package:easycard/src/Models/post/deleteNotification.dart';
// import 'package:easycard/src/Repository/appLocalization.dart';
// import 'package:easycard/src/Repository/networkUtlis.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());

  static NotificationsCubit get(context) => BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();
  NotificationModel notificationModel;
  List<DatumNotifications> notifications = [] ;

  getNotifications() async {

    emit(NotificationsLoadingState());

    _utils.get('list-notifications',).then((value) {
      if (value.statusCode == 200) {
        print('list-notifications=====Success');
        notificationModel = NotificationModel.fromJson(value.data);
        notifications = notificationModel.data;
        emit(NotificationsSuccessState(notificationModel: notificationModel));
      } else {
        print('list-notifications=====Failed >>> ${value.data}');
        notificationModel = NotificationModel.fromJson(value.data);
        // notifications = [] ;
        emit(NotificationsErrorState(error: notificationModel.error[0].value));
      }
    }).catchError((error) {
      print("catchError : $error");
      // notifications = [] ;
      emit(NotificationsErrorState(error: customError));
    });
  }

  // NotificationModel readNotificationModel;
  // // List<DatumNotification> readNotificationsList = [];
  //
  // readNotifications({context}) async {
  //   // final List<DatumNotification> loadedNotifications = [];
  //   emit(ReadNotificationsLoadingState());
  //
  //   _utils.get('is_read',).then((value) {
  //     if (value.statusCode == 200) {
  //       print('is_read=====Success');
  //       readNotificationModel = NotificationModel.fromJson(value.data);
  //       // readNotificationsList = notificationModel.data;
  //       emit(ReadNotificationsSuccessState(
  //           notificationModel: notificationModel));
  //
  //       // NewNotificationCubit.get(context).getNewNotifications(context: context);
  //
  //     } else {
  //       print('is_read=====Failed >>> ${value.data}');
  //       readNotificationModel = NotificationModel.fromJson(value.data);
  //       // readNotificationsList = loadedNotifications.reversed.toList();
  //       emit(ReadNotificationsErrorState(
  //           error: notificationModel.error[0].value));
  //     }
  //   }).catchError((error) {
  //     print("catchError : $error");
  //     // emit(ReadNotificationsErrorState(error: localization.text("error")));
  //   });
  // }

  DeletNotificationModel _model;
  int indexOfDeletedNotification ;

  deleteNotification({int notificationId,int index}) async {
    indexOfDeletedNotification = index ;
    emit(DeleteNotificationsLoadingState());
    FormData formData = FormData.fromMap({});
    _utils
        .post('delete_Notifications/$notificationId', body: formData, )
        .then((value) {
      if (value.statusCode == 200) {
        print('delete_Notification=====Success');
        _model = DeletNotificationModel.fromJson(value.data);
        showToast(
            msg: "تم مسح الاشعار",
            state: ToastStates.SUCCESS);
        emit(DeleteNotificationsSuccessState(model: _model));

        getNotifications();
      } else {
        print('delete_Notification=====Failed >>> ${value.data}');
        _model = DeletNotificationModel.fromJson(value.data);
        showToast(msg: _model.error.value, state: ToastStates.ERROR);
        emit(DeleteNotificationsErrorState(error: _model.error.value));
      }
    }).catchError((error) {
      print("catchError : $error");
      emit(DeleteNotificationsErrorState(error: customError));
    });
  }




  var acceptExchangeModel;
int indexOfNotifications ;
  acceptOrRefuseChange({context,int subscriptionId,int userId,int accept,int index}) async {
    indexOfNotifications = index ;
   ( accept == 0) ?
    emit(RefuseExchangeLoadingState()) :
    emit(AcceptExchangeLoadingState());
    FormData formData = FormData.fromMap({
      "subscription_id": subscriptionId,
      "user_id": userId,
      "accept": accept,
    });
    _utils
        .post('accept_or_refuse_exchange_card', body: formData,)
        .then((value) {
      if (value.statusCode == 200) {
        print('accept_or_refuse_exchange_card=====Success');
        // acceptExchangeModel = AcceptExchangeModel.fromJson(value.data);
        showToast(
            msg: "تم مسح الاشعار",
            state: ToastStates.SUCCESS);
        emit(AcceptExchangeSuccessState(model: acceptExchangeModel));

        getNotifications();
      } else {
        print('accept_or_refuse_exchange_card=====Failed >>> ${value.data}');
        // acceptExchangeModel = AcceptExchangeModel.fromJson(value.data);
        showToast(msg: acceptExchangeModel.error[0].value, state: ToastStates.ERROR);
        emit(AcceptExchangeErrorState(error: acceptExchangeModel.error[0].value));
      }
    }).catchError((error) {
      print("catchError : $error");
      // emit(AcceptExchangeErrorState(error: localization.text("error")));
    });
  }
}
