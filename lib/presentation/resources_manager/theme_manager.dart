import 'package:flutter/material.dart';
import 'package:flutter_start_up_project/presentation/resources_manager/font_manager.dart';
import 'package:flutter_start_up_project/presentation/resources_manager/styles_manager.dart';
import 'package:flutter_start_up_project/presentation/resources_manager/values_manager.dart';

import 'color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    /// main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey,

    // cardView Theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.lightGrey,
      elevation: AppSize.s5,

      margin: const EdgeInsets.all(AppSize.s5),
      // shape:
    ),

    ///AppBar Theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.appbarColor,
      elevation: AppSize.s5,
      shadowColor: ColorManager.appbarColorShadow,
      titleTextStyle:
          getRegulerStyle(FontSize.s16, ColorManager.appBarTextColor),
    ),

    ///button theme

    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.buttonDisableColor,
      buttonColor: ColorManager.buttonColor,
      splashColor: ColorManager.buttonSplashColor,
    ),

    /// elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle:
            getRegulerStyle(FontSize.s18, ColorManager.elevatedButtonTextColor),
        primary: ColorManager.elevatedButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    ///text theme

    textTheme: TextTheme(
      displayLarge: getLightStyle(FontSize.s20, ColorManager.displayLargeText),
      headline1: getLightStyle(FontSize.s20, ColorManager.headline1),
      subtitle1: getLightStyle(FontSize.s10, ColorManager.subtitle1),
      subtitle2: getLightStyle(FontSize.s14, ColorManager.subtitle2),
      caption: getLightStyle(FontSize.s20, ColorManager.caption),
      bodyText1: getLightStyle(FontSize.s12, ColorManager.bodyText1),
      bodyMedium: getLightStyle(FontSize.s16, ColorManager.bodyMedium),
    ),

    ///inputDecoration theme (TextFormField)

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPading.p12),
      hintStyle:
          getRegulerStyle(FontSize.s10, ColorManager.textFormFieldHintStyle),
      labelStyle:
          getMeduimStyle(FontSize.s14, ColorManager.textFormFieldLabelStyle),
      errorStyle: getRegulerStyle(FontSize.s10, ColorManager.error),
      // enabled border style
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorManager.outlineInputBorderColor, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      // foucsed border style
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

      /// error border style

      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

      /// focusedErrorBorder border style

      focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    ),
  );
}
