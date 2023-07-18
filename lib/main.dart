import 'package:ecommerce_app/data/local/chach_helper.dart';
import 'package:ecommerce_app/data/localization/app_lang.dart';
import 'package:ecommerce_app/presentation/presentation_managers/routes_managers.dart';
import 'package:ecommerce_app/presentation/screens/auth/view_model/auth_cubit.dart';
import 'package:ecommerce_app/presentation/screens/language/view_model/language_cubit.dart';
import 'package:ecommerce_app/presentation/screens/onboarding/view_model/onboarding_cubit.dart';
import 'package:ecommerce_app/utities/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ChachHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 988),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (BuildContext context, Widget? child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => LanguageCubit()..getSavedLanguage()),
              BlocProvider(create: (context) => OnBoardingCubit()),
              BlocProvider(create: (context) => AuthCubit()),
            ],
            child: BlocBuilder<LanguageCubit,LanguageState>(
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Ecommerce App',
                  theme: LanguageCubit.get(context).themeData ,
                  onGenerateRoute: RoutesGenerator.getRoutes,
                  initialRoute: Routes.splashRoute,
                  locale: state is ChangeLocaleState ? state.locale : null,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate
                  ],
                  supportedLocales: const [
                    Locale('en', ''),
                    Locale('ar', ''),
                  ],
                  localeResolutionCallback: (currentLang, supportLang) {
                    if (currentLang != null) {
                      for (Locale locale in supportLang) {
                        if (locale.languageCode == currentLang.languageCode) {
                          return currentLang;
                        }
                      }
                    }
                    return supportLang.first;
                  },
                );
              }
            ),
          );
        });
  }
}
