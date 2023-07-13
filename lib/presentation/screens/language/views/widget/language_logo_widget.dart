import 'package:ecommerce_app/presentation/presentation_managers/assets_managers.dart';
import 'package:ecommerce_app/presentation/presentation_managers/color_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageLogo extends StatelessWidget {
  const LanguageLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 70.r,
        backgroundColor: ColorManager.primaryColor,
        child: ClipOval(
          child: Image.asset(
            ImageAssets.logo,
          ),
        ));
  }
}
