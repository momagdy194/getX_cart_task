import 'package:flutter/material.dart';

import 'color.dart';

ThemeData themeData= ThemeData(
  dialogBackgroundColor: Colors.white,
  brightness: Brightness.light,
  canvasColor: Colors.black,
  primaryColor: const Color(0xff2CB9B0),
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: AppColors.bg,
  disabledColor: const Color(0xffe9e9e9),
  errorColor: AppColors.error,
  hintColor: const Color(0xff9099A4),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  indicatorColor: const Color(0xff2CB9B0),
  primaryIconTheme: const IconThemeData(
    color: Colors.white,
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.coinsActionColor),
        borderRadius: BorderRadius.circular(14)),
    border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.mediumGrey),
        borderRadius: BorderRadius.circular(14)),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.mediumGrey),
        borderRadius: BorderRadius.circular(14)),
    fillColor: AppColors.fillColor,
    filled: true,
  ),


   bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor:   Color(0xffFCFEFF) ),
  bottomAppBarTheme: const BottomAppBarTheme(color:   Color(0xfFf4F9FA),elevation: 0),
   sliderTheme: SliderThemeData(overlayShape: SliderComponentShape.noThumb),
);