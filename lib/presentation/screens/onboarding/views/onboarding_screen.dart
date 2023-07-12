import 'package:ecommerce_app/data/localization/app_lang.dart';
import 'package:ecommerce_app/presentation/global_widgets/global_button.dart';
import 'package:ecommerce_app/presentation/presentation_managers/color_managers.dart';
import 'package:ecommerce_app/presentation/presentation_managers/string_manager.dart';
import 'package:ecommerce_app/presentation/screens/onboarding/view_model/onboarding_cubit.dart';
import 'package:ecommerce_app/presentation/screens/onboarding/view_model/onboarding_state.dart';
import 'package:ecommerce_app/presentation/screens/onboarding/views/widget/custom_slider.dart';
import 'package:ecommerce_app/presentation/screens/onboarding/views/widget/dot_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          OnBoardingCubit cubit = OnBoardingCubit.get(context);
          return Scaffold(
              backgroundColor: ColorManager.backGroundColor,
              body: SafeArea(
                child: Column(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: CustomSliderOnBoarding(),
                    ),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Column(
                            children: [
                              const CustomDotControllerOnBoarding(),
                              const Spacer(
                                flex: 1,
                              ),
                              GlobalButton(
                                height: 60.h,
                                width: 388.w,
                                text: AppStrings.next.tr(context),
                                colorText: Colors.white,
                                onPressed: () {
                                  cubit.next(context);
                                },
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ));
        });
  }
}
