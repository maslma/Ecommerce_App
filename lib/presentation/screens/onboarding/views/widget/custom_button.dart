import 'package:ecommerce_app/presentation/presentation_managers/color_managers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonOnBoarding extends StatelessWidget {

  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      margin: EdgeInsets.only(bottom: 30.h),
      child:MaterialButton(
        onPressed: () {  },

        padding: EdgeInsets.symmetric(horizontal: 100.w,vertical: 0),
        color: ColorManager.primaryColor,
        textColor: Colors.white,
        child: const Text('Let\'s Go'),
      ),);
  }
}
