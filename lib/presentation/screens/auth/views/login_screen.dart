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
import 'package:ecommerce_app/presentation/screens/language/views/widget/language_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(
      listener: (context,state){},
      builder: (context,state){
        AuthCubit cubit = AuthCubit.get(context);
        return Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
              children: [
                SizedBox(height: 55.h,),
                const LanguageLogo(),
                SizedBox(height: 15.h,),
                CustomTitleAuth(title: AppStrings.login.tr(context),),
                SizedBox(height: 14.h,),
                CustomBodyAuth(body:  AppStrings.pleaseEnter.tr(context),),
                SizedBox(height: 18.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTitleTextField(titleTextField:AppStrings.phone.tr(context) ,),
                    SizedBox(height: 8.h,),
                    GlobalTextFormField(
                      controller: cubit.phoneLogin,
                      maxLength: 12,
                      hintText: AppStrings.enterPhone.tr(context),
                      keyboardType: TextInputType.phone,
                      suffixIcon: Icons.phone_outlined,
                    ),
                    SizedBox(height: 18.h,),
                    CustomTitleTextField(titleTextField:AppStrings.password.tr(context) ,),
                    SizedBox(height: 8.h,),
                    GlobalTextFormField(
                      controller: cubit.passwordLogin,
                      hintText: AppStrings.enterPassword.tr(context),
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: Icons.remove_red_eye_outlined,
                    ),
                  ],
                ),
                SizedBox(height: 16.h,),
                GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, Routes.languageRoute);
                    },
                    child: Text(AppStrings.forgetPassword.tr(context),style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500,),textAlign: TextAlign.end,)),
                SizedBox(height: 24.h,),
                GlobalButton(height: 60.h,width: 388.w,radius:8.r ,text:AppStrings.login2.tr(context),colorText: Colors.white,onPressed: () {},),
                SizedBox(height: 15.h,),
                Text(AppStrings.or.tr(context),style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
                SizedBox(height: 27.h,),
                CustomSocialAuth(onTap: (){},image:ImageAssets.facebook ,text: AppStrings.facebook.tr(context),),
                SizedBox(height: 34.h,),
                CustomSocialAuth(onTap: (){},image:ImageAssets.google ,text: AppStrings.google.tr(context),),
                SizedBox(height: 54.h,),
                CustomHaveAccountAuth(
                  onTap: ()=>Navigator.pushReplacementNamed(context, Routes.registerRoute),
                  haveText:AppStrings.haveAccount.tr(context) ,
                  accountText:AppStrings.signUp.tr(context) ,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
