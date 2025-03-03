import 'package:flutter/material.dart';
import 'package:tut_app/presentaion/color_manager.dart';
import 'package:tut_app/presentaion/font_manager.dart';
import 'package:tut_app/presentaion/styles_manager.dart';
import 'package:tut_app/presentaion/values_manager.dart';

ThemeData getApplicationTheme() {
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
          elevation: AppSizes.s0),
      //appBar color
      appBarTheme: AppBarTheme(
          color: ColorManager.primaryColor,
          elevation: AppSizes.s0,
          shadowColor: ColorManager.lightPrimary,
          centerTitle: true,
          titleTextStyle: getSemiBoldStyle(
              color: ColorManager.whiteColor, fontSize: FontSize.s16)),
      //button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(
                  fontSize: FontSize.s17, color: ColorManager.whiteColor),
              backgroundColor: ColorManager.primaryColor,
              shadowColor: ColorManager.lightPrimary,
              elevation: AppSizes.s0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: ColorManager.grey1),
                  borderRadius: BorderRadius.circular(AppSizes.s10)))),
      buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primaryColor,
        splashColor: ColorManager.lightPrimary,
      ),

      //text Theme

      textTheme: TextTheme(
          headlineLarge: getSemiBoldStyle(
              fontSize: FontSize.s16, color: ColorManager.titleColor),
          headlineMedium: getRegularStyle(
              fontSize: FontSize.s14, color: ColorManager.titleColor),
          displayMedium: getMediumStyle(
              fontSize: FontSize.s16, color: ColorManager.primaryColor),
          displaySmall: getRegularStyle(
              fontSize: FontSize.s14, color: ColorManager.hintColor),
          displayLarge: getRegularStyle(
              fontSize: FontSize.s17, color: ColorManager.whiteColor),
          bodyMedium: getRegularStyle(
              fontSize: FontSize.s12, color: ColorManager.primaryColor),
          bodySmall: getRegularStyle(
              fontSize: FontSize.s11, color: ColorManager.hintColor),
          labelMedium: getSemiBoldStyle(
              fontSize: FontSize.s16, color: ColorManager.whiteColor),
          labelLarge: getSemiBoldStyle(
              fontSize: FontSize.s18, color: ColorManager.primaryColor),
          labelSmall: getMediumStyle(
              fontSize: FontSize.s14, color: ColorManager.textColor),
          bodyLarge: getRegularStyle(
              fontSize: FontSize.s14, color: ColorManager.grey1),
          titleSmall: getRegularStyle(fontSize: FontSize.s12, color: ColorManager.grey2)
      ),
      //input decoration Theme(Text formField Theme)
      //Navigation Theme
      );
}
