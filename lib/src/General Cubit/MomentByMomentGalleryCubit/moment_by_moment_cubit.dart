
import 'package:bashir_village/src/models/momentModel.dart';
import 'package:bashir_village/src/network/azmyNetworkUtlis.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'moment_by_moment_state.dart';

class MomentByMomentCubit extends Cubit<MomentByMomentState> {
  MomentByMomentCubit() : super(MomentByMomentInitial());

  static MomentByMomentCubit get(context) => BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();
  MomentModel model;
  List<DatumMoment> momentByMoment = [];


  getMomentByMoment() async {
    emit(MomentByMomentLoadingState());
    Map<String, String> headers = {};
    _utils.get('moment_by_moment',headers: headers).then((value) {
      if (value.statusCode == 200) {
        print('moment_by_moment=====Success');
        model = MomentModel.fromJson(value.data);
        momentByMoment = model.data;
        emit(MomentByMomentSuccessState(model: model));
      } else {
        print('moment_by_moment=====Failed');
        model = MomentModel.fromJson(value.data);
        // Videos = null ;
        emit(MomentByMomentErrorState(error: model.error[0].value));
      }
    }).catchError((error) {
      print("catchError : $error");
      // Videos = null ;
      emit(MomentByMomentErrorState(error:"حدث خطأ ما ... يرجي اعادة المحاولة"));
    });
  }

}
