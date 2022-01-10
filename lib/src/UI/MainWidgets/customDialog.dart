import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class CustomDialog {
  Future<dynamic> showWarningDialog(
      {BuildContext context, String msg, Function btnOnPress}) {
    return AwesomeDialog(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.WARNING,
            body: Center(child: Text(msg)),
            btnOkOnPress: btnOnPress,
            btnOkText: 'موافق')
        .show();
  }

  Future<dynamic> showErrorDialog({BuildContext context, Function btnOnPress}) {
    return AwesomeDialog(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.ERROR,
            body: Center(child: Text('حدث خطأ ما')),
            btnOkOnPress: btnOnPress,
            btnOkText: 'موافق')
        .show();
  }

  Future<dynamic> showSuccessDialog(
      {BuildContext context, String msg, String btnMsg, Function btnOnPress}) {
    return AwesomeDialog(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.SUCCES,
            body: Center(child: Text(msg)),
            btnOkOnPress: btnOnPress,
            btnOkText: btnMsg)
        .show();
  }

  Future<dynamic> showOptionDialog(
      {BuildContext context,
      String msg,
      String okMsg,
      Function okFun,
      String cancelMsg,
      Function cancelFun}) {
    return AwesomeDialog(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.INFO,
            body: Center(child: Text(msg)),
            btnOkOnPress: okFun,
            btnOkText: okMsg,
            btnCancelOnPress: cancelFun,
            btnCancelText: cancelMsg)
        .show();
  }

  Future<dynamic> showWidgetDialog({
    BuildContext context,
    String okMsg,
    Function okFun,
    Widget body,
  }) {
    return AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.INFO,
      body: body,
      btnOkOnPress: okFun,
      btnOkText: okMsg,
    ).show();
  }
}
