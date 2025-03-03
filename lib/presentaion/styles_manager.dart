import 'dart:ui';
import 'package:tut_app/presentaion/font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color);
}

//Bold Style
TextStyle getBoldStyle({required double fontSize,required Color color}){
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}
//Semi Bold Style
TextStyle getSemiBoldStyle({required double fontSize,required Color color}){
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}
//Medium Style
TextStyle getMediumStyle({required double fontSize,required Color color}){
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}
//Regular Style
TextStyle getRegularStyle({required double fontSize,required Color color}){
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}
//Light Style
TextStyle getLightStyle({required double fontSize,required Color color}){
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}
