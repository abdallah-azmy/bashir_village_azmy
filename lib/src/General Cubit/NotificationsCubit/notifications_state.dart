part of 'notifications_cubit.dart';


abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}
class NotificationsLoadingState extends NotificationsState {}
class NotificationsSuccessState extends NotificationsState {
  var notificationModel;
  NotificationsSuccessState({this.notificationModel});
}
class NotificationsErrorState extends NotificationsState {
  final String error;
  NotificationsErrorState({this.error});
}


class ReadNotificationsLoadingState extends NotificationsState {}
class ReadNotificationsSuccessState extends NotificationsState {
  var notificationModel;
  ReadNotificationsSuccessState({this.notificationModel});
}
class ReadNotificationsErrorState extends NotificationsState {
  final String error;
  ReadNotificationsErrorState({this.error});}


class DeleteNotificationsLoadingState extends NotificationsState {}
class DeleteNotificationsSuccessState extends NotificationsState {
  var model;
  DeleteNotificationsSuccessState({this.model});
}
class DeleteNotificationsErrorState extends NotificationsState {
  final String error;
  DeleteNotificationsErrorState({this.error});}

class AcceptExchangeLoadingState extends NotificationsState {}
class RefuseExchangeLoadingState extends NotificationsState {}
class AcceptExchangeSuccessState extends NotificationsState {
  var model;
  AcceptExchangeSuccessState({this.model});
}
class AcceptExchangeErrorState extends NotificationsState {
  final String error;
  AcceptExchangeErrorState({this.error});}


