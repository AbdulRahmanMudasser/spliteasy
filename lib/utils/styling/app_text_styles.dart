import 'package:flutter/material.dart';

import 'package:tip_calculator/utils/extensions/responsive_extension.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle darkSmallTextStyle = TextStyle(
    fontFamily: 'TypeWriter',
    fontSize: 10.0.sp,
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
  );

  static TextStyle darkMediumTextStyle = TextStyle(
    fontFamily: 'TypeWriter',
    fontSize: 12.0.sp,
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
  );

  static TextStyle darkLargeTextStyle = TextStyle(
    fontFamily: 'TypeWriter',
    fontSize: 14.0.sp,
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
  );

  static TextStyle lightSmallTextStyle = TextStyle(
    fontFamily: 'TypeWriter',
    fontSize: 10.0.sp,
    color: AppColors.lightTextColor,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
  );

  static TextStyle lightLargeTextStyle = TextStyle(
    fontFamily: 'TypeWriter',
    fontSize: 14.0.sp,
    color: AppColors.lightTextColor,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
  );
}
