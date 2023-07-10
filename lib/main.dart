import 'package:ecommerce_app/presentation/presentation_managers/routes_managers.dart';
import 'package:ecommerce_app/presentation/presentation_managers/theme_manager.dart';
import 'package:ecommerce_app/presentation/screens/onboarding/view_model/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(377, 813),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (BuildContext context, Widget? child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => OnBoardingCubit()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Ecommerce App',
              theme:getThemeData(),
              onGenerateRoute: RoutesGenerator.getRoutes,
              initialRoute: Routes.onboardingRoute,
            ),
          );
        });
  }
}
