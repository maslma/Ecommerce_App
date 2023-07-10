import 'package:ecommerce_app/presentation/presentation_managers/color_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getThemeData()
{
  return ThemeData(
    primarySwatch: Colors.blue,
    useMaterial3: true,
    textTheme: TextTheme(
        displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp,color: ColorManager.black),
        bodyLarge: TextStyle(
            height: 1.5.h,
            color: ColorManager.grey,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold),
    ),
    fontFamily: "PlayfairDisplay"
  );
}