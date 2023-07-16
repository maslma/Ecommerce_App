import 'package:ecommerce_app/presentation/presentation_managers/color_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalTextFormField extends StatelessWidget {
  final double? height;
  final double? width;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final String? hintText;
  final int? maxLength;
  final String? Function(String?) valid;
  const GlobalTextFormField(
      {super.key,
       this.height,
       this.width,
       this.keyboardType,
       this.controller,
       this.suffixIcon,
         this.hintText,
        this.maxLength,
        required this.valid});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid,
      cursorColor: ColorManager.black,
      textAlign: TextAlign.start,
      controller: controller,
      keyboardType: keyboardType,
      maxLength: maxLength,
      style: TextStyle(
          color: ColorManager.black,
          fontWeight: FontWeight.w600,
          fontSize: 16.sp),
      decoration: InputDecoration(
          suffixIcon: Icon(
            suffixIcon,
            color: ColorManager.grey2,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
              color: ColorManager.grey2,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
              borderSide: const BorderSide(color: ColorManager.grey2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
              borderSide:
                  const BorderSide(color: ColorManager.primaryColor))),
    );
  }
}
