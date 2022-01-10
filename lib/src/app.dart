import 'package:bashir_village/main.dart';
import 'package:bashir_village/src/General%20Cubit/AboutVillageCubit/about_village_cubit.dart';
import 'package:bashir_village/src/General%20Cubit/AddToFavCubit/add_toFav_cubit.dart';
import 'package:bashir_village/src/General%20Cubit/AdminPhoneCubit/admin_phone_cubit.dart';
import 'package:bashir_village/src/General%20Cubit/ChangePasswordCubit/change_password_cubit.dart';
import 'package:bashir_village/src/General%20Cubit/CommentsCubit/comments_cubit.dart';
import 'package:bashir_village/src/General%20Cubit/ContactUsCubit/contactUs_cubit.dart';
import 'package:bashir_village/src/General%20Cubit/EditProfileCubit/editProfile_cubit.dart';
import 'package:bashir_village/src/General%20Cubit/FavouriteNewsCubit/fav_News_cubit.dart';
import 'package:bashir_village/src/General%20Cubit/MomentByMomentGalleryCubit/moment_by_moment_cubit.dart';
import 'package:bashir_village/src/General%20Cubit/NotificationsCubit/notifications_cubit.dart';
import 'package:bashir_village/src/General%20Cubit/PhotoGalleryCubit/photo_gallery_cubit.dart';
import 'package:bashir_village/src/General%20Cubit/SeenCubit/seen_cubit.dart';
import 'package:bashir_village/src/General%20Cubit/SliderCubit/slider_cubit.dart';
import 'package:bashir_village/src/General%20Cubit/UnPinnedNewsCubit/unPinned_News_cubit.dart';
import 'package:bashir_village/src/General%20Cubit/VideoGalleryCubit/video_gallery_cubit.dart';
import 'package:bashir_village/src/General%20Cubit/VillageWelcomeCubit/village_welcome_cubit.dart';
import 'package:bashir_village/src/UI/Basics/Register/Login/loginCubit/login_cubit.dart';
import 'package:bashir_village/src/UI/Basics/Register/SignUp/signUpCubit/sign_up_cubit.dart';
import 'package:bashir_village/src/UI/Basics/Register/confirmCode/confirmCodeCubit/confirm_code_cubit.dart';
import 'package:bashir_village/src/UI/Basics/Register/forgetPassword/forgetPasswordCubit/forget_password_cubit.dart';
import 'package:bashir_village/src/provider/aboutVillage.dart';
import 'package:bashir_village/src/provider/addCommenProvider.dart';
import 'package:bashir_village/src/provider/addToFavProvider.dart';
import 'package:bashir_village/src/provider/changePasswordProvider.dart';
import 'package:bashir_village/src/provider/checkCodeEmail.dart';
import 'package:bashir_village/src/provider/contactUsProvider.dart';
import 'package:bashir_village/src/provider/deletFavProvider.dart';
import 'package:bashir_village/src/provider/deletNotificationProvider.dart';
import 'package:bashir_village/src/provider/forgetPasswordProvider.dart';
import 'package:bashir_village/src/provider/getCommentByIdProvider.dart';
import 'package:bashir_village/src/provider/getFavProvider.dart';
import 'package:bashir_village/src/provider/getNewsByIdProvider.dart';
import 'package:bashir_village/src/provider/login.dart';
import 'package:bashir_village/src/provider/moment.dart';
import 'package:bashir_village/src/provider/photoGallary.dart';
import 'package:bashir_village/src/provider/pinNewsProvider.dart';
import 'package:bashir_village/src/provider/register.dart';
import 'package:bashir_village/src/provider/resetPasswordProvider.dart';
import 'package:bashir_village/src/provider/seenProvider.dart';
import 'package:bashir_village/src/provider/unPinNews.dart';
import 'package:bashir_village/src/provider/videoProvider.dart';
import 'package:bashir_village/src/provider/villageWelcomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'UI/Intro/splash.dart';
import 'UI/Notifications/notificationDetails.dart';
import 'provider/ConfirmCode.dart';
import 'provider/editUserDataProvider.dart';
import 'provider/notificationProvider.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String newsId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>LoginCubit()),
        BlocProvider(create: (_)=>SignUpCubit()),
        BlocProvider(create: (_)=>ForgetPasswordCubit()),
        BlocProvider(create: (_)=>ConfirmCodeCubit()),
        BlocProvider(create: (_)=>ForgetPasswordCubit()),



        BlocProvider(create: (_)=>SliderCubit()),
        BlocProvider(create: (_)=>UnPinnedNewsCubit()),
        BlocProvider(create: (_)=>ContactUsCubit()),
        BlocProvider(create: (_)=>NotificationsCubit()),
        BlocProvider(create: (_)=>FavNewsCubit()),
        BlocProvider(create: (_)=>EditProfileCubit()),
        BlocProvider(create: (_)=>AboutVillageCubit()),
        BlocProvider(create: (_)=>VillageWelcomeCubit()),
        BlocProvider(create: (_)=>AdminPhoneCubit()),
        BlocProvider(create: (_)=>ChangePasswordCubit()),
        BlocProvider(create: (_)=>SeenCubit()),
        BlocProvider(create: (_)=>AddToFavCubit()),
        BlocProvider(create: (_)=>PhotoGalleryCubit()),
        BlocProvider(create: (_)=>VideoGalleryCubit()),
        BlocProvider(create: (_)=>MomentByMomentCubit()),
        BlocProvider(create: (_)=>CommentsCubit()),




        // BlocProvider(create: (_)=>NewNotificationCubit()..getNewNotifications(context: context)),


      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: CheckCodeEmail()),
          ChangeNotifierProvider.value(value: ResetPasswordProvider()),
          ChangeNotifierProvider.value(value: LoginProvider()),
          ChangeNotifierProvider.value(value: RegisterProvider()),
          ChangeNotifierProvider.value(value: AboutVilageProvider()),
          ChangeNotifierProvider.value(value: MomentProvider()),
          ChangeNotifierProvider.value(value: PhotoGallaryProvider()),
          ChangeNotifierProvider.value(value: VideoProvider()),
          ChangeNotifierProvider.value(value: PinNewsProvider()),
          ChangeNotifierProvider.value(value: EditUserDataProvider()),
          ChangeNotifierProvider.value(value: UnPinNewsProvider()),
          ChangeNotifierProvider.value(value: EditUserDataProvider()),
          ChangeNotifierProvider.value(value: ForgetPasswordProvider()),
          ChangeNotifierProvider.value(value: ConfirmCodeProvider()),
          ChangeNotifierProvider.value(value: AddCommentProvider()),
          ChangeNotifierProvider.value(value: ContactUSProvider()),
          ChangeNotifierProvider.value(value: ChangePasswordProvider()),
          ChangeNotifierProvider.value(value: WelcomeVillageProvider()),
          ChangeNotifierProvider.value(value: NotoficationProvider()),
          ChangeNotifierProvider.value(value: GetNewsByIdProvider()),
          ChangeNotifierProvider.value(value: SeenProvider()),
          ChangeNotifierProvider.value(value: DeletNotificationProvider()),
          ChangeNotifierProvider.value(value: GetCommentsByIdProvider()),
          ChangeNotifierProvider.value(value: AddToFavProvider()),
          ChangeNotifierProvider.value(value: GetFavProvider()),
          ChangeNotifierProvider.value(value: DeletFavProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigator,
          theme: ThemeData(primaryColor: Color.fromRGBO(52, 128, 90, 1)),
          routes: <String, WidgetBuilder>{
            '/': (BuildContext context) => SplashScreen(),
            '/news': (BuildContext context) =>
                NotificationDetails(
                  id: int.parse(newsId),
                ),
          },
          title: "قرية البشير",
        ),
      ),
    );
  }
}
