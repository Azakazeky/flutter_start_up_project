import 'package:flutter/cupertino.dart';
import 'package:flutter_start_up_project/presentation/resources_manager/font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: FontConstant.fontFamilyName);
}

// light Style

TextStyle getLightStyle(double fontSize, Color color) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}
// reguler Style

TextStyle getRegulerStyle(double fontSize, Color color) {
  return _getTextStyle(fontSize, FontWeightManager.reguler, color);
}

// meduim Style

TextStyle getMeduimStyle(double fontSize, Color color) {
  return _getTextStyle(fontSize, FontWeightManager.meduim, color);
}

// bold Style

TextStyle getBoldStyle(double fontSize, Color color) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

// semiBold Style

TextStyle getSemiBoldStyle(double fontSize, Color color) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}
