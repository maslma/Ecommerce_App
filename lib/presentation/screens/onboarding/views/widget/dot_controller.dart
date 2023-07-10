import 'package:ecommerce_app/domain/data_source/static/onboarding_static.dart';
import 'package:ecommerce_app/presentation/presentation_managers/color_managers.dart';
import 'package:ecommerce_app/presentation/screens/onboarding/view_model/onboarding_cubit.dart';
import 'package:ecommerce_app/presentation/screens/onboarding/view_model/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDotControllerOnBoarding  extends StatelessWidget {
  const CustomDotControllerOnBoarding ({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit,OnBoardingStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        OnBoardingCubit cubit = OnBoardingCubit.get(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                onBoardingList.length,
                    (index) => AnimatedContainer(
                  margin: EdgeInsets.only(right: 5.w),
                  duration: const Duration(milliseconds: 900),
                  width:cubit.currentPage == index ? 20.w :6.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                      color: ColorManager.primaryColor,
                      borderRadius: BorderRadius.circular(10.r)),
                ))
          ],
        );
      },
    );
  }
}
