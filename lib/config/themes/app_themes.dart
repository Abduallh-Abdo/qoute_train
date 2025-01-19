import 'package:flutter/material.dart';
import 'package:qoute_train/core/utils/app_colors.dart';

ThemeData appThemes() {
  return ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,

    //* AppBar
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.colorWidgets,
    ),

    //* TextTheme
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        height: 1.3,
      ),
    ),
  );
}
