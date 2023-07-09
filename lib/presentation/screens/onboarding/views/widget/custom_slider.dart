import 'package:ecommerce_app/domain/data_source/static/onboarding_static.dart';
import 'package:ecommerce_app/presentation/presentation_managers/color_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSliderOnBoarding extends StatelessWidget {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) => Column(
        children: [
          Text(
            onBoardingList[index].title!,
            style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
          ),
          SizedBox(
            height: 80.h,
          ),
          Image.asset(onBoardingList[index].image!,
              width: 200.w, height: 230.h, fit: BoxFit.fill),
          SizedBox(
            height: 80.h,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onBoardingList[index].body!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 1.5.h,
                  color: ColorManager.grey,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
