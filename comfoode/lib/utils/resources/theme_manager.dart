import 'package:comfoode/utils/resources/color_manager.dart';
import 'package:comfoode/utils/resources/font_manager.dart';
import 'package:comfoode/utils/resources/style_manager.dart';
import 'package:comfoode/utils/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main color of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primary,

    disabledColor: ColorManager.lightBlue,
    accentColor: ColorManager.lightBlue,
    fontFamily: 'Poppins',
    // card view  theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      elevation: AppSize.s4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s26),
      ),
    ),
    // ripple
    shadowColor: Colors.grey,
    //  button view theme
    buttonTheme: ButtonThemeData(
      buttonColor: ColorManager.primary,
      disabledColor: ColorManager.white,
      shape: StadiumBorder(),
      splashColor: ColorManager.lightBlue,
    ),
    //  elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          primary: ColorManager.lightBlue,
          elevation: AppSize.s4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSize.s12,
            ),
          ),
          textStyle: getRegularTextStyle(
            color: ColorManager.white,
            fontSize: FontSizeManager.s12,
          )),
    ),
    //  app bar view theme
    appBarTheme: AppBarTheme(
      elevation: AppSize.s4,
      color: ColorManager.primary,
      iconTheme: IconThemeData(
        color: ColorManager.black,
        size: 32,
      ),
      centerTitle: true,
      shadowColor: Colors.grey,
      titleTextStyle: getRegularTextStyle(
        color: ColorManager.white,
        fontSize: FontSizeManager.s16,
      ),
    ),
    // text theme

    textTheme: TextTheme(
      headline1: getSemiBoldTextStyle(
        color: ColorManager.textcolor,
        fontSize: FontSizeManager.s16,
      ),
      subtitle1: getMediumTextStyle(
        color: ColorManager.textcolor,
        fontSize: FontSizeManager.s14,
      ),
      subtitle2: getMediumTextStyle(
        color: ColorManager.primary,
        fontSize: FontSizeManager.s14,
      ),
      caption: getRegularTextStyle(
        color: ColorManager.textcolor,
        fontSize: FontSizeManager.s12,
      ),
      bodyText1: getRegularTextStyle(
        color: ColorManager.textcolor,
        fontSize: FontSizeManager.s12,
      ),
    ),

    // input decoration( text filed them)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularTextStyle(
        color: ColorManager.textcolor,
        fontSize: FontSizeManager.s12,
      ),
      labelStyle: getRegularTextStyle(
        color: ColorManager.textcolor,
        fontSize: FontSizeManager.s12,
      ),
      errorStyle: getRegularTextStyle(
        color: ColorManager.error,
        fontSize: FontSizeManager.s12,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.white, width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(
          AppSize.s17,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.white, width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(
          AppSize.s17,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.white, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s17),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(
          AppSize.s17,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(
          AppSize.s17,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(
          AppSize.s17,
        ),
      ),
    ),
  );
}
