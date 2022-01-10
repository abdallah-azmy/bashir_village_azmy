import 'package:bashir_village/src/General%20Cubit/MomentByMomentGalleryCubit/moment_by_moment_cubit.dart';
import 'package:bashir_village/src/UI/MainWidgets/app_error.dart';
import 'package:bashir_village/src/UI/MainWidgets/customDrawer.dart';
import 'package:bashir_village/src/UI/MainWidgets/list_animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../MainWidgets/newsCard.dart';

class MomentByMoment extends StatefulWidget {
  @override
  _MomentByMomentState createState() => _MomentByMomentState();
}

class _MomentByMomentState extends State<MomentByMoment>
    with SingleTickerProviderStateMixin {


  @override
  void initState() {
    MomentByMomentCubit.get(context).getMomentByMoment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('لحظة بلحظة'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      endDrawer: CustomDrawer(),
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      body:

          BlocBuilder<MomentByMomentCubit, MomentByMomentState>(
            builder: (context, state)  {
              var cubit = MomentByMomentCubit.get(context);
              return

                RefreshIndicator(
                  onRefresh: () {
                    return MomentByMomentCubit.get(context).getMomentByMoment();
                  },
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    children: [
                      (state is MomentByMomentLoadingState)
                          ? Container(
                        height: MediaQuery.of(context)
                            .size
                            .height *
                            .7,
                            child: Center(
                        child: SpinKitThreeBounce(
                            size: 25,
                            color: Theme.of(context).primaryColor,
                        ),
                      ),
                          )
                          : (state is MomentByMomentErrorState)
                          ? AppError(
                        height: MediaQuery.of(context)
                            .size
                            .height *
                            .7,
                        text: state.error,
                      )
                          : Column(
                        children: <Widget>[
                          SizedBox(height: 20),
                          ListAnimator(
                            physics: false,
                            // scrollDirection: Axis.vertical,
                            data: cubit.momentByMoment,
                            child: (index) {
                              return NewsCard(
                                title: cubit
                                    .momentByMoment[index]
                                    .title,
                                content: cubit
                                    .momentByMoment[index]
                                    .content,
                                createAt: cubit
                                    .momentByMoment[index]
                                    .createdAt,
                                images: cubit
                                    .momentByMoment[index]
                                    .photos,
                                comments: cubit
                                    .momentByMoment[index]
                                    .comments,
                                newsId: cubit
                                    .momentByMoment[index].id,
                                seen: cubit
                                    .momentByMoment[index]
                                    .seen,
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
          ),


    );
  }
}
