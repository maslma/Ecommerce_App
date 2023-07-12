import 'package:ecommerce_app/presentation/presentation_managers/color_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageRadioWidget extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final Function(String?) onChange;

  const LanguageRadioWidget({super.key, required this.value, required this.groupValue, required this.onChange, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600),),
        Radio(
          value:value ,
          groupValue:groupValue,
          activeColor: ColorManager.primaryColor,
          onChanged:onChange,
        ),
      ],
    );
  }
}
