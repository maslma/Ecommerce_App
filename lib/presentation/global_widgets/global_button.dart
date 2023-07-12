import 'package:ecommerce_app/presentation/presentation_managers/color_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalButton extends StatelessWidget {
  final Function()? onPressed;
  final String? text;
  final Color? colorText;
  final double? radius;
  final double? height;
  final double? width;

  const GlobalButton({
    super.key,
    this.onPressed,
     this.text,
     this.height,
     this.width,
     this.colorText,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 15.0),
          ),
          backgroundColor: ColorManager.primaryColor,
        ),
        child: Center(
          child: Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: colorText,
            ),
          ),
        ),
      ),
    );
  }
}
