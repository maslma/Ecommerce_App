import 'package:ecommerce_app/data/localization/app_lang.dart';
import 'package:ecommerce_app/presentation/global_widgets/global_button.dart';
import 'package:ecommerce_app/presentation/presentation_managers/color_managers.dart';
import 'package:ecommerce_app/presentation/presentation_managers/routes_managers.dart';
import 'package:ecommerce_app/presentation/presentation_managers/string_manager.dart';
import 'package:ecommerce_app/presentation/screens/language/view_model/language_cubit.dart';
import 'package:ecommerce_app/presentation/screens/language/views/widget/language_radio_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LanguageView extends StatelessWidget {
  const LanguageView({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LanguageCubit,LanguageState>(
      listener: (context,state){},
      builder:(context,state) {
        LanguageCubit cubit = LanguageCubit.get(context);
        return Scaffold(
          body:SafeArea(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 210.h,),
                  Text(AppStrings.ecommerceShop.tr(context),style: TextStyle(fontWeight: FontWeight.w700,fontSize:40.sp),),
                  SizedBox(height: 70.h,),
                  Text(AppStrings.selectLanguage.tr(context),style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700)),
                  SizedBox(height: 18.h,),
                  LanguageRadioWidget(title: "English",value: AppStrings.lang.tr(context), groupValue: "English", onChange:(val)=>cubit.changeLanguage()),
                  Divider(color: ColorManager.black.withAlpha(20),),
                  LanguageRadioWidget(title: AppStrings.arabic.tr(context),value: AppStrings.lang.tr(context), groupValue: "Arabic", onChange:(val)=>cubit.changeLanguage()),
                  SizedBox(height: 140.h,),
                  GlobalButton(height: 60.h,width: 388.w,text:AppStrings.enter.tr(context),colorText: Colors.white,onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.onboardingRoute);

                  },)
                ],
              ),
            ),
          ),
        );
      },
    );

  }
}
