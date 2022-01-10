import 'dart:ui';

import 'package:flutter/material.dart';

class MyColors{

  static const orange=Color(0xfffead00);
  static const screenBackGround=Color(0xffF6F8FA);
  static const grey= Color(0xffdfe0e2);
  static const red= Color(0xffF14651);
  static const green= Color(0xff53AE57);
  static const unActive= Color(0xff78A7C2);
  static const lightGrey= Color(0xfff3f3f3);

  static const blue= Color(0xff53D3E0);
  static const darkBlue4= Color(0xffBCD3E0);
  static const blueBlack=Color(0xff254151);
  static const blueBlack2=Color(0xff447794);
  static const blueBlack3=Color(0xff78A7C2);
  static const lightBlue=Color(0xff58BFE6);
  static const veryLightBlue=Color(0xffEEFAFF);

  static const white=Color(0xfff7f7f9);
  static const styleNormalSmal2=TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.normal
  );
  static const styleBoldRed=TextStyle(
      color: Colors.red,
      fontSize: 15,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.bold
  );
  static const styleNormalSmallOrange=TextStyle(
      color: Color(0xfffead00),
      fontSize: 13,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.normal
  );
  static const styleNormal1Orange=TextStyle(
      color: Colors.orange,
      fontSize: 16,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.normal
  );
  static const styleBoldSmal2Orange=TextStyle(
      color: Color(0xfffead00),
      fontSize: 11,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.bold
  );
  static const styleBold1white=TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.bold,
      height: 1.2
  );
  static const styleButtonText=TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.w700

  );
  static const styleNormalSmall2=TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.normal
  );
  static const styleNormalSmall=TextStyle(
      color: Colors.black,
      fontSize: 13,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.normal
  );
  static const styleNormal0=TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.normal,
      height: 1.2
  );
  static const styleNormalSmall0=TextStyle(
      color: Colors.black,
      fontSize: 13,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.normal,
  );
  static const styleNormal1=TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.normal
  );

  static const styleNameLink= TextStyle(
  color: MyColors.blueBlack2,
  fontSize: 14,
  fontFamily: "IBM Plex Arabic",
  fontWeight: FontWeight.w400,
  decoration: TextDecoration.underline
  );
  static const styleNormalOrangePrice=TextStyle(
      color: Color(0xfffead00),
      fontSize: 15,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.bold
  );
  static const styleNormalOrangeReceived=TextStyle(
      color: Color(0xfffead00),
      fontSize: 18,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.bold
  );
  static const styleBoldSmal2=TextStyle(
      color: Colors.black,
      fontSize: 11,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.bold
  );

  static const forTabs=TextStyle(
//      color: Colors.black,
      fontSize: 13,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.bold
  );

  static const tabs=TextStyle(
      color: Colors.black,
      fontSize: 13,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.bold
  );
  static const styleBoldSmall=TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.bold
  );
  static const styleBoldSmallWhite1=TextStyle(
      color: Colors.white,
      fontSize: 10,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.bold
  );
  static const styleBoldSmallWhite=TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.bold
  );
  static const styleBoldSmallWhite14=TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.bold
  );
  static const styleBold0=TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.bold,
      height: 1.2

  );

  static const styleDetails=TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.underline,

  );

  static const styleDetailsWhite=TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontFamily: "IBM Plex Arabic",
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,

  );

  static const styleBold0white=TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.bold,
      height: 1.2

  );
  static const styleBold1=TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.bold,
    height: 1.2
  );
  static const styleHint=TextStyle(
      color: MyColors.blueBlack,
      fontSize: 16,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.w400,
      height: 1.2
  );
  static const styleMediumHint=TextStyle(
      color: MyColors.blueBlack,
      fontSize: 14,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.w400,
      height: 1.2

  );
  static const styleMedium2Hint=TextStyle(
      color: MyColors.blueBlack,
      fontSize: 14,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.w500,
      height: 1.2

  );
  static const styleSmallHint=TextStyle(
      color: MyColors.blueBlack,
      fontSize: 12,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.w400,
      height: 1.3
  );
  static const styleSmallWhiteHint=TextStyle(
      color: Colors.white,
      fontSize: 13,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.w400,
      height: 1.2
  );
  static const styleBoldRed1=TextStyle(
      color: Colors.red,
      fontSize: 18,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.bold
  );
  static const styleBoldRedNotification=TextStyle(
      color: Colors.red,
      fontSize: 22,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.bold
  );
  static const styleNormal2=TextStyle(
      color: Colors.black,
      fontSize: 19,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.w500
  );
  static const styleNormal3=TextStyle(
      color: Colors.black,
      fontSize: 22,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.w500
  );
  static const styleNormalBig=TextStyle(
      color: Colors.black,
      fontSize: 50,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.w500
  );
  static const styleNormalSmallWhite=TextStyle(
      color: Colors.white,
      fontSize: 11,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.normal
  );
  static const styleNormalSmallWhite14=TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.normal
  );
  static const styleNormalWhite=TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.normal
  );
  static const styleNormalWhite2=TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.normal
  );
  static const styleNormalBlueBlack=TextStyle(
      color: Color(0xff254151),
      fontSize: 16,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.normal
  );
  static const styleBoldBlue=TextStyle(
      color: MyColors.lightBlue,
      fontSize: 16,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.w700
  );
  static const styleNormalWhite0=TextStyle(
      color: Colors.white,
      fontSize: 13,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.normal,
      height: 1.2
  );
  static const styleNormalOrange=TextStyle(
      color: Colors.orange,
      fontSize: 16,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.normal
  );
  static const styleBoldOrange=TextStyle(
      color: Colors.orange,
      fontSize: 16,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.bold
  );
  static const styleBoldGreen=TextStyle(
      color: Colors.green,
      fontSize: 16,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.bold
  );
  static const styleBold2=TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.bold
  );
  static const styleBold2white=TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.bold
  );
  static const styleBold3white=TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.bold
  );
  static const styleBold3=TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.bold
  );
  static const styleBoldWhite4=TextStyle(
      color: Colors.white,
      fontSize: 23,
      height: 1.1,
      fontFamily: "IBM Plex Arabic",
      fontWeight: FontWeight.w700
  );
}