import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/font_family.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Styles {
  Styles._(); // this basically makes it so you can't instantiate this class

  static TextStyle body1TextStyle() => TextStyle(
        fontFamily: FontFamily.pretenDard,
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
      );

  static TextStyle body2TextStyle() => TextStyle(
        fontFamily: FontFamily.pretenDard,
        fontWeight: FontWeight.w700,
        fontSize: 14.sp,
      );

  static TextStyle heading2TextStyle() => TextStyle(
        fontFamily: FontFamily.pretenDard,
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
      );

  static TextStyle body2MediumTextStyle() => TextStyle(
        fontFamily: FontFamily.pretenDard,
        fontWeight: FontWeight.w500,
        color: AppColors.textHintColor,
        fontSize: 14.sp,
      );

  static TextStyle body2SemiBoldTextStyle() => TextStyle(
        fontFamily: FontFamily.pretenDard,
        fontWeight: FontWeight.w600,
        color: AppColors.lightGrayColor,
        fontSize: 15.sp,
      );

  static TextStyle subHeadSemiBoldTextStyle() => TextStyle(
        fontFamily: FontFamily.pretenDard,
        fontWeight: FontWeight.w600,
        color: AppColors.darkGrayColor,
        fontSize: 18.sp,
      );
  static TextStyle subHeadBoldTextStyle() => TextStyle(
        fontFamily: FontFamily.pretenDard,
        fontWeight: FontWeight.w700,
        color: Color(0xFF212529),
        fontSize: 18.sp,
      );

  static TextStyle cap2MediumTextStyle() => TextStyle(
        fontFamily: FontFamily.pretenDard,
        fontWeight: FontWeight.w500,
        color: AppColors.darkGrayColor,
        fontSize: 14.sp,
      );

  static TextStyle caption1SemiBoldTextStyle() => TextStyle(
        fontFamily: FontFamily.pretenDard,
        fontWeight: FontWeight.w600,
        color: AppColors.checkButtonActiveColor,
        fontSize: 13.sp,
      );

  static TextStyle cap2SemiBoldTextStyle() => TextStyle(
        fontFamily: FontFamily.pretenDard,
        fontWeight: FontWeight.w600,
        color: AppColors.checkButtonActiveColor,
        fontSize: 12.sp,
      );

  static TextStyle caption3MediumTextStyle() => TextStyle(
        fontFamily: FontFamily.pretenDard,
        fontWeight: FontWeight.w500,
        color: AppColors.checkButtonActiveColor,
        fontSize: 11.sp,
      );

  static TextStyle caption3SemiBoldTextStyle() => TextStyle(
        fontFamily: FontFamily.pretenDard,
        fontWeight: FontWeight.w600,
        color: Color(0XFF4A525C),
        fontSize: 11.sp,
      );

  static TextStyle errorTextStyle() => TextStyle(
        fontFamily: FontFamily.pretenDard,
        fontWeight: FontWeight.w500,
        color: AppColors.errorRed,
        fontSize: 11.sp,
      );
}
