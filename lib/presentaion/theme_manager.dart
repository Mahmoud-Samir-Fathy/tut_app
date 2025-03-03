import 'package:flutter/material.dart';
import 'package:tut_app/presentaion/color_manager.dart';
import 'package:tut_app/presentaion/styles_manager.dart';
import 'package:tut_app/presentaion/values_manager.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    //main color
    primaryColor: ColorManager.primaryColor,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,
    //card view color
    cardTheme: CardTheme(
      color: ColorManager.whiteColor,
      shadowColor: ColorManager.grey2,
      elevation: AppSizes.s0
    ),
    //appBar color
    appBarTheme: AppBarTheme(
      color: ColorManager.primaryColor,
      elevation: AppSizes.s0,
      shadowColor: ColorManager.lightPrimary,
      centerTitle: true,
      titleTextStyle: getSemiBoldStyle(color: ColorManager.whiteColor)
    )
    //button Theme
    //text Theme
    //input decoration Theme(Text formField Theme)
    //Navigation Theme
  );
}