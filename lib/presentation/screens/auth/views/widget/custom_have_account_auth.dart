import 'package:ecommerce_app/presentation/presentation_managers/color_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHaveAccountAuth extends StatelessWidget {
  final String haveText;
  final String accountText;
  final Function() onTap;

  const CustomHaveAccountAuth({super.key, required this.haveText, required this.accountText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(haveText,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
        SizedBox(width: 4.w,),
        GestureDetector(
            onTap: onTap,
            child: Text(accountText,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700,color: ColorManager.black),textAlign: TextAlign.center,)),
      ],
    );
  }
}
