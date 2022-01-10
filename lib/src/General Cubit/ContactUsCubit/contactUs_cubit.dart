import 'package:bashir_village/src/UI/MainWidgets/toast.dart';
import 'package:bashir_village/src/network/azmyNetworkUtlis.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bashir_village/src/models/contactUsModel.dart';
part 'contactUs_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitial());

  static ContactUsCubit get(context) => BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();
  ChangePasswordModel model;
  String message = "";
  String number = "";

  contactUs() async {
    emit(ContactUsLoadingState());
    FormData formData = FormData.fromMap({
      "number": number,
      "message": message,
    });
    _utils.post('contact_us', body: formData, ).then((value) {
      if (value.statusCode == 200) {
        print('contact-us=====Success');
        model = ChangePasswordModel.fromJson(value.data);
        showToast(
            msg: "تم ارسال الرسالة بنجاح",
            state: ToastStates.SUCCESS);

        emit(ContactUsSuccessState(model: model));
      } else {
        print('contact-us=====Failed');
        model = ChangePasswordModel.fromJson(value.data);
        showToast(msg: model.error[0].value, state: ToastStates.ERROR);

        emit(ContactUsErrorState(error: model.error[0].value));
      }
    }).catchError((error) {
      print("catchError : $error");
      emit(ContactUsErrorState(error: "حدث خطأ ما يرجي اعادة المحاولة"));
    });
  }
}
