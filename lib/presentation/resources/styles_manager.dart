import 'package:flutter/cupertino.dart';
import 'package:mvvm_shop/presentation/resources/color_manager.dart';
import 'package:mvvm_shop/presentation/resources/font_manager.dart';

TextStyle _getTextStyle(
  Color color,
  double fontsize,
  FontWeight fontWeight,
) {
  return TextStyle(
      color: color,
      fontFamily: FontFamilyManager.family,
      fontSize: fontsize,
      fontWeight: fontWeight);
}

// regular style
TextStyle getRegularStyle(
    {Color FontColor = ColorManager.grey1,
    double size = FontSize.s14,
    FontWeight weight = FontWeightManager.regular}) {
  return _getTextStyle(FontColor, size, weight);
}

// bold style
TextStyle getBoldStyle(
    {Color FontColor = ColorManager.grey,
    double size = FontSize.s16,
    FontWeight weight = FontWeightManager.bold}) {
  return _getTextStyle(FontColor, size, weight);
}

// semibold style
TextStyle getSemiBoldStyle(
    {Color FontColor = ColorManager.grey,
    double size = FontSize.s14,
    FontWeight weight = FontWeightManager.semibold}) {
  return _getTextStyle(FontColor, size, weight);
}

// medium style
TextStyle getMediumStyle(
    {Color FontColor = ColorManager.grey,
    double size = FontSize.s12,
    FontWeight weight = FontWeightManager.medium}) {
  return _getTextStyle(FontColor, size, weight);
}
