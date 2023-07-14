import 'package:ecommerce_app/presentation/presentation_managers/color_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBodyAuth extends StatelessWidget {
  final String body;
  final Color? color;
  const CustomBodyAuth({super.key, required this.body, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
     body,
      style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color:  color ?? ColorManager.grey2),
      textAlign: TextAlign.center,
    );
  }
}
