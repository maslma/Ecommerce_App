import 'package:ecommerce_app/data/localization/app_lang.dart';
import 'package:ecommerce_app/presentation/global_widgets/global_button.dart';
import 'package:ecommerce_app/presentation/presentation_managers/color_managers.dart';
import 'package:ecommerce_app/presentation/presentation_managers/routes_managers.dart';
import 'package:ecommerce_app/presentation/presentation_managers/string_manager.dart';
import 'package:ecommerce_app/presentation/screens/auth/view_model/auth_cubit.dart';
import 'package:ecommerce_app/presentation/screens/auth/views/widget/custom_body_auth.dart';
import 'package:ecommerce_app/presentation/screens/auth/views/widget/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);
        return Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
              children: [
                SizedBox(height:65.h ,),
                CustomTitleAuth(
                  title: AppStrings.Otp.tr(context),
                ),
                SizedBox(
                  height: 14.h,
                ),
                CustomBodyAuth(
                  body: AppStrings.authenticationCode.tr(context),
                ),
                CustomBodyAuth(
                  body: AppStrings.number.tr(context),
                  color: ColorManager.primaryColor,
                ),
                SizedBox(
                  height: 28.h,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: OtpTextField(
                    fieldWidth: 48.w,
                    cursorColor: ColorManager.primaryColor,
                    borderRadius: BorderRadius.circular(8.r),
                    numberOfFields: 5,
                    enabledBorderColor: ColorManager.grey2,
                    focusedBorderColor: ColorManager.primaryColor,
                    margin: EdgeInsets.symmetric(horizontal: 12.w),
                    textStyle: TextStyle(
                        color: ColorManager.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 24.sp),
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {},
                  ),
                ),
                SizedBox(
                  height: 48.h,
                ),
                GlobalButton(
                  height: 60.h,
                  width: 388.w,
                  radius: 8.r,
                  text: AppStrings.submit.tr(context),
                  colorText: Colors.white,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.resetPasswordRoute);
                  },
                ),
                SizedBox(
                  height: 32.h,
                ),
                CustomBodyAuth(
                  body: AppStrings.codeSent.tr(context),
                ),
                CustomBodyAuth(
                  body: AppStrings.second.tr(context),
                  color: ColorManager.primaryColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
