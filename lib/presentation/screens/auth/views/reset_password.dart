import 'package:ecommerce_app/data/localization/app_lang.dart';
import 'package:ecommerce_app/presentation/global_widgets/global_button.dart';
import 'package:ecommerce_app/presentation/global_widgets/global_text_form_field.dart';
import 'package:ecommerce_app/presentation/presentation_managers/routes_managers.dart';
import 'package:ecommerce_app/presentation/presentation_managers/string_manager.dart';
import 'package:ecommerce_app/presentation/screens/auth/view_model/auth_cubit.dart';
import 'package:ecommerce_app/presentation/screens/auth/views/widget/custom_body_auth.dart';
import 'package:ecommerce_app/presentation/screens/auth/views/widget/custom_title_auth.dart';
import 'package:ecommerce_app/presentation/screens/auth/views/widget/custom_title_textField_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_outlined)),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
              children: [
                CustomTitleAuth(
                  title: AppStrings.resetPassword2.tr(context),
                ),
                SizedBox(
                  height: 14.h,
                ),
                CustomBodyAuth(
                  body: AppStrings.createPassword.tr(context),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTitleTextField(
                      titleTextField: AppStrings.password.tr(context),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    GlobalTextFormField(
                      controller: cubit.passwordResetPassword,
                      hintText: AppStrings.enterPassword.tr(context),
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: Icons.remove_red_eye_outlined,
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    CustomTitleTextField(
                      titleTextField: AppStrings.confirmPassword.tr(context),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    GlobalTextFormField(
                      controller: cubit.confirmPasswordResetPassword,
                      hintText: AppStrings.enterConfirmPassword.tr(context),
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: Icons.remove_red_eye_outlined,
                    ),
                  ],
                ),
                SizedBox(
                  height: 48.h,
                ),
                GlobalButton(
                  height: 60.h,
                  width: 388.w,
                  radius: 8.r,
                  text: AppStrings.savePassword.tr(context),
                  colorText: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(
                        context, Routes.successResetRoute);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
