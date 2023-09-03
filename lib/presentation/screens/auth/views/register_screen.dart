import 'package:ecommerce_app/data/localization/app_lang.dart';
import 'package:ecommerce_app/presentation/global_widgets/global_button.dart';
import 'package:ecommerce_app/presentation/global_widgets/global_text_form_field.dart';
import 'package:ecommerce_app/presentation/presentation_managers/assets_managers.dart';
import 'package:ecommerce_app/presentation/presentation_managers/routes_managers.dart';
import 'package:ecommerce_app/presentation/presentation_managers/string_manager.dart';
import 'package:ecommerce_app/presentation/screens/auth/view_model/auth_cubit.dart';
import 'package:ecommerce_app/presentation/screens/auth/views/widget/custom_body_auth.dart';
import 'package:ecommerce_app/presentation/screens/auth/views/widget/custom_have_account_auth.dart';
import 'package:ecommerce_app/presentation/screens/auth/views/widget/custom_social_auth.dart';
import 'package:ecommerce_app/presentation/screens/auth/views/widget/custom_title_auth.dart';
import 'package:ecommerce_app/presentation/screens/auth/views/widget/custom_title_textField_auth.dart';
import 'package:ecommerce_app/utities/main_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          AuthCubit cubit = AuthCubit.get(context);
          return Scaffold(
            body: WillPopScope(
              onWillPop: () => alertExitApp(context),
              child: cubit.statusRequest ==
                  StatusRequest.loading
                  ? Center(child: Lottie.asset(ImageAssets.loading , width: 250.w , height: 250.h))
                  : Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Form(
                  key: cubit.formKeySignUp,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      CustomTitleAuth(
                        title: AppStrings.register.tr(context),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      CustomBodyAuth(
                        body: AppStrings.pleaseEnter.tr(context),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTitleTextField(
                            titleTextField:
                            AppStrings.fullName.tr(context),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          GlobalTextFormField(
                            valid: (val) {
                              return validateInput(
                                  val!,
                                  3,
                                  20,
                                  AppStrings.fullName.tr(context),
                                  context);
                            },
                            controller: cubit.fullNameSignUp,
                            hintText:
                            AppStrings.enterFillName.tr(context),
                            keyboardType: TextInputType.name,
                            suffixIcon: Icons.person_2_outlined,
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          CustomTitleTextField(
                            titleTextField:
                            AppStrings.email.tr(context),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          GlobalTextFormField(
                            valid: (val) {
                              return validateInput(
                                  val!,
                                  3,
                                  40,
                                  AppStrings.email.tr(context),
                                  context);
                            },
                            controller: cubit.emailSignUp,
                            hintText: AppStrings.enterEmail.tr(context),
                            keyboardType: TextInputType.emailAddress,
                            suffixIcon: Icons.email_outlined,
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          CustomTitleTextField(
                            titleTextField:
                            AppStrings.phone.tr(context),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          GlobalTextFormField(
                            valid: (val) {
                              return validateInput(
                                  val!,
                                  10,
                                  12,
                                  AppStrings.phone.tr(context),
                                  context);
                            },
                            controller: cubit.phoneSignUp,
                            hintText: AppStrings.enterPhone.tr(context),
                            keyboardType: TextInputType.phone,
                            suffixIcon: Icons.phone_outlined,
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          CustomTitleTextField(
                            titleTextField:
                            AppStrings.password.tr(context),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          GlobalTextFormField(
                            valid: (val) {
                              return validateInput(
                                  val!,
                                  5,
                                  30,
                                  AppStrings.password.tr(context),
                                  context);
                            },
                            onTapIcon: () {
                              cubit.showPassword();
                            },
                            obscureText: cubit.isShowPassword,
                            controller: cubit.passwordSignUp,
                            hintText:
                            AppStrings.enterPassword.tr(context),
                            keyboardType: TextInputType.visiblePassword,
                            suffixIcon: cubit.isShowPassword == true
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
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
                        text: AppStrings.register2.tr(context),
                        colorText: Colors.white,
                        onPressed: () {
                          cubit.signUp(context);
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        AppStrings.or.tr(context),
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                      CustomSocialAuth(
                        onTap: () {},
                        image: ImageAssets.facebook,
                        text: AppStrings.facebook.tr(context),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomSocialAuth(
                        onTap: () {},
                        image: ImageAssets.google,
                        text: AppStrings.google.tr(context),
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      CustomHaveAccountAuth(
                        onTap: () => Navigator.pushReplacementNamed(
                            context, Routes.loginRoute),
                        haveText: AppStrings.haveAccount.tr(context),
                        accountText: AppStrings.signIn.tr(context),
                      ),
                      SizedBox(
                        height: 10.h,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
