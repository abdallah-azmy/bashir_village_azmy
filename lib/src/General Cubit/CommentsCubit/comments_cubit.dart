
import 'package:bashir_village/src/UI/MainWidgets/toast.dart';
import 'package:bashir_village/src/models/addCommentModel.dart';
import 'package:bashir_village/src/models/getCommentsByIDModel.dart';
import 'package:bashir_village/src/models/momentModel.dart';
import 'package:bashir_village/src/network/azmyNetworkUtlis.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit() : super(CommentsInitial());

  static CommentsCubit get(context) => BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();
  GetCommentByIddModel model;
  List<DatumComments> comments = [];


  getComments({int id}) async {
    emit(CommentsLoadingState());

    _utils.get('get_comment_by_id/$id',).then((value) {
      if (value.statusCode == 200) {
        print('get_comment_by_id=====Success');
        model = GetCommentByIddModel.fromJson(value.data);
        comments = model.data;
        emit(CommentsSuccessState(model: model));
      } else {
        print('get_comment_by_id=====Failed');
        model = GetCommentByIddModel.fromJson(value.data);
        // Videos = null ;
        emit(CommentsErrorState(error: model.error[0].value));
      }
    }).catchError((error) {
      print("catchError : $error");
      // Videos = null ;
      emit(CommentsErrorState(error:"حدث خطأ ما ... يرجي اعادة المحاولة"));
    });
  }

  String comment ;
  AddCommentModel addCommentModel ;
  addComment({int id}) async {
    emit(AddCommentLoadingState());
    FormData formData = FormData.fromMap({"comment": comment, });

    _utils.post("user_add_comment/$id", body: formData,).then((value) {
      if (value.statusCode == 200) {
        print('user_add_comment=====Success');
        addCommentModel = AddCommentModel.fromJson(value.data);
        showToast(
            msg: "تم اضافة التعليق بنجاح",
            state: ToastStates.SUCCESS);
        getComments(id: id);
        emit(AddCommentSuccessState(model: addCommentModel));
      } else {
        print('user_add_comment=====Failed');
        addCommentModel = AddCommentModel.fromJson(value.data);
        showToast(msg: addCommentModel.error[0].value, state: ToastStates.ERROR);
        // Videos = null ;
        emit(AddCommentErrorState(error: addCommentModel.error[0].value));
      }
    }).catchError((error) {
      print("catchError : $error");
      // Videos = null ;
      emit(AddCommentErrorState(error:"حدث خطأ ما ... يرجي اعادة المحاولة"));
    });
  }

}
