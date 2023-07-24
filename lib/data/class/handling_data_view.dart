import 'package:ecommerce_app/presentation/presentation_managers/assets_managers.dart';
import 'package:ecommerce_app/utities/main_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ?   Center(child: Lottie.asset(ImageAssets.loading , width: 250.w , height: 250.h))
        : statusRequest == StatusRequest.offlinefailure
        ? Center(child: Lottie.asset(ImageAssets.offline , width: 250.w , height: 250.h))
        : statusRequest == StatusRequest.serverfailure
        ?Center(child: Lottie.asset(ImageAssets.server , width: 250.w , height: 250.h))
        : statusRequest == StatusRequest.failure
        ? Center(child: Lottie.asset(ImageAssets.noData , width: 250.w , height: 250.h , repeat: false  ))
        : widget;
  }
}