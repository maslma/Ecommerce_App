import 'package:ecommerce_app/presentation/screens/onboarding/views/widget/custom_button.dart';
import 'package:ecommerce_app/presentation/screens/onboarding/views/widget/custom_slider.dart';
import 'package:ecommerce_app/presentation/screens/onboarding/views/widget/dot_controller.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: CustomSliderOnBoarding(),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  CustomDotControllerOnBoarding(),
                  Spacer(
                    flex: 2,
                  ),
                  CustomButtonOnBoarding()
                ],
              ))
        ],
      ),
    ));
  }
}
