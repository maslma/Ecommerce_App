import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSocialAuth extends StatelessWidget {
  final String image , text;
  final Function() onTap;
  const CustomSocialAuth({super.key, required this.image, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image,width: 32.w,height: 32.h,),
          SizedBox(width: 12.h,),
          Text(text,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600,),textAlign: TextAlign.center,),
        ],
      ),
    );
  }

}
