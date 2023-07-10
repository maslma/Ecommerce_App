import 'package:ecommerce_app/presentation/presentation_managers/color_managers.dart';
import 'package:ecommerce_app/presentation/screens/onboarding/view_model/onboarding_cubit.dart';
import 'package:ecommerce_app/presentation/screens/onboarding/view_model/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonOnBoarding extends StatelessWidget {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          OnBoardingCubit cubit = OnBoardingCubit.get(context);
          return Container(
            height: 45.h,
            margin: EdgeInsets.only(bottom: 30.h),
            child: MaterialButton(
              onPressed: ()
              {
                cubit.next(context);
              },
              padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 0),
              color: ColorManager.primaryColor,
              textColor: Colors.white,
              child:  Text('Let\'s Go',style: TextStyle(fontSize: 18.sp),textAlign: TextAlign.center,),
            ),
          );
        });
  }
}
