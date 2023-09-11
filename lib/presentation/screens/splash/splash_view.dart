import 'dart:async';
import 'package:ecommerce_app/data/local/chach_helper.dart';
import 'package:ecommerce_app/presentation/presentation_managers/assets_managers.dart';
import 'package:ecommerce_app/presentation/presentation_managers/color_managers.dart';
import 'package:ecommerce_app/presentation/presentation_managers/routes_managers.dart';
import 'package:ecommerce_app/presentation/screens/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _statrtDelay() {
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }

  _goNext() {
    if (ChachHelper.sharedPreferences.get("step") == "1") {
      Navigator.pushReplacementNamed(context, Routes.languageRoute);
    }
    if (ChachHelper.sharedPreferences.get("step") == "2") {
      Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) {
            return const HomeView();
          },
        ),
        (route) => false,
      );
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _statrtDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: Stack(
        children: [
          Positioned(
            top: 280.h,
            left: 0,
            right: 0,
            child: Image.asset(
              ImageAssets.logo,
              height: 400.h,
              width: 400.w,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
