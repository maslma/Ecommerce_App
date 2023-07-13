import 'package:ecommerce_app/presentation/presentation_managers/color_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBodyAuth extends StatelessWidget {
  final String body;
  const CustomBodyAuth({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Text(
     body,
      style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: ColorManager.grey2),
      textAlign: TextAlign.center,
    );
  }
}
