import 'package:ecommerce_app/data/localization/app_lang.dart';
import 'package:ecommerce_app/domain/data_source/static/onboarding_static.dart';
import 'package:ecommerce_app/presentation/screens/onboarding/view_model/onboarding_cubit.dart';
import 'package:ecommerce_app/presentation/screens/onboarding/view_model/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSliderOnBoarding extends StatelessWidget {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          OnBoardingCubit cubit = OnBoardingCubit.get(context);
          return PageView.builder(
            controller: cubit.pageController,
            onPageChanged: (val) {
              cubit.onPageChange(val);
            },
            itemCount: onBoardingList.length,
            itemBuilder: (context, index) => Column(
              children: [
                SizedBox(
                  height: 70.h,
                ),
                Image.asset(onBoardingList[index].image!,),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  onBoardingList[index].title!.tr(context),
                  style:Theme.of(context).textTheme.displayLarge,
                ), SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    onBoardingList[index].body!.tr(context),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge
                  ),
                )
              ],
            ),
          );
        });
  }
}
