import 'package:flutter/material.dart';
import 'package:mvvm_shop/presentation/resources/color_manager.dart';
import 'package:mvvm_shop/presentation/resources/font_manager.dart';
import 'package:mvvm_shop/presentation/resources/styles_manager.dart';
import 'package:mvvm_shop/presentation/resources/values_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    // main theme
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,
    //card theme
    cardTheme: const CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey1,
      elevation: AppSize.s4,
    ),
    appBarTheme: AppBarTheme(
      color: ColorManager.primary,
      shadowColor: ColorManager.lightPrimary,
      centerTitle: true,
      elevation: AppSize.s4,
      titleTextStyle:
          getRegularStyle(FontColor: ColorManager.white, size: FontSize.s16),
    ),
    //button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: getRegularStyle(
              FontColor: ColorManager.white, size: FontSize.s16),
          backgroundColor: ColorManager.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12))),
    ),
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(
          FontColor: ColorManager.darkGrey, size: FontSize.s16),
      headlineLarge: getSemiBoldStyle(
          FontColor: ColorManager.darkGrey, size: FontSize.s16),
      headlineMedium: getSemiBoldStyle(
          FontColor: ColorManager.darkGrey, size: FontSize.s14),
      titleMedium:
          getMediumStyle(FontColor: ColorManager.primary, size: FontSize.s16),
      bodyLarge: getRegularStyle(FontColor: ColorManager.grey1),
      bodySmall:
          getRegularStyle(FontColor: ColorManager.grey1, size: FontSize.s12),
      labelSmall: getBoldStyle(FontColor: ColorManager.primary),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: getRegularStyle(FontColor: ColorManager.grey),
      labelStyle: getRegularStyle(FontColor: ColorManager.grey),
      errorStyle: getRegularStyle(FontColor: ColorManager.error),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    ),
  );
}
