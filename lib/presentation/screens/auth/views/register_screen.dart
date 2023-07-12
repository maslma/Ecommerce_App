import 'package:ecommerce_app/presentation/global_widgets/global_button.dart';
import 'package:ecommerce_app/presentation/global_widgets/global_text_form_field.dart';
import 'package:ecommerce_app/presentation/presentation_managers/assets_managers.dart';
import 'package:ecommerce_app/presentation/presentation_managers/color_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
         children: [
           SizedBox(height: 158.h,),
           Text("Register",style: TextStyle(fontSize: 28.sp,fontWeight: FontWeight.w700,),textAlign: TextAlign.center,),
           SizedBox(height: 14.h,),
           Text("Please Enter your Phone and password\n to continue",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500,color: ColorManager.grey2),textAlign: TextAlign.center,),
           SizedBox(height: 18.h,),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("Full Name",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,),textAlign: TextAlign.start,),
               SizedBox(height: 8.h,),
               const GlobalTextFormField(
                 controller: null,
                 hintText: 'Enter your fill name',
                 keyboardType: TextInputType.name,
                 suffixIcon: Icons.person_2_outlined,
               ),
               SizedBox(height: 18.h,),
               Text("Phone",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,),textAlign: TextAlign.start,),
               SizedBox(height: 8.h,),
               const GlobalTextFormField(
                 controller: null,
                 hintText: 'Enter your phone',
                 keyboardType: TextInputType.phone,
                 suffixIcon: Icons.phone_outlined,
               ),
               SizedBox(height: 18.h,),
               Text("Password",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,),textAlign: TextAlign.start,),
               SizedBox(height: 8.h,),
               const GlobalTextFormField(
                 controller: null,
                 hintText: 'Enter your password',
                 keyboardType: TextInputType.visiblePassword,
                 suffixIcon: Icons.remove_red_eye_outlined,
               ),
               SizedBox(height: 48.h,),
               GlobalButton(height: 60.h,width: 388.w,radius:8.r ,text:"Register",colorText: Colors.white,onPressed: () {},),
             ],
           ),
           SizedBox(height: 15.h,),
           Text("OR",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
           SizedBox(height: 27.h,),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset(ImageAssets.facebook,width: 32.w,height: 32.h,),
               SizedBox(width: 12.h,),
               Text("Facebook",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600,),textAlign: TextAlign.center,),
             ],
           ),
           SizedBox(height: 34.h,),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset(ImageAssets.google,width: 32.w,height: 32.h,),
               SizedBox(width: 12.h,),
               Text("Google",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600,),textAlign: TextAlign.center,),
             ],
           ),
           SizedBox(height: 34.h,),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Have Account ?",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
               TextButton(onPressed: (){},child:Text("Sign in",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700,color: ColorManager.black),textAlign: TextAlign.center,)),
             ],
           ),
         ],
        ),
      ),
    );
  }
}
