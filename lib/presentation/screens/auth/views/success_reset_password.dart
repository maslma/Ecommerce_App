import 'package:ecommerce_app/data/localization/app_lang.dart';
import 'package:ecommerce_app/presentation/global_widgets/global_button.dart';
import 'package:ecommerce_app/presentation/presentation_managers/color_managers.dart';
import 'package:ecommerce_app/presentation/presentation_managers/routes_managers.dart';
import 'package:ecommerce_app/presentation/presentation_managers/string_manager.dart';
import 'package:ecommerce_app/presentation/screens/auth/views/widget/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessResetPassword extends StatelessWidget {

  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal:20.w),
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              Align(
                alignment: Alignment.topCenter,
                child: CustomTitleAuth(
                  title: AppStrings.success.tr(context),
                ),
              ),
              SizedBox(height: 250.h,),
              Center(
                  child: Icon(
                    Icons.check_circle_outline,
                    size: 250.sp,
                    color: ColorManager.primaryColor,
                  )),
              CustomTitleAuth(
                title: AppStrings.setSuccessfully.tr(context),
              ),
              const Spacer(),
              GlobalButton(
                height: 60.h,
                width: 388.w,
                radius: 8.r,
                text: AppStrings.goToLogin.tr(context),
                colorText: Colors.white,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
