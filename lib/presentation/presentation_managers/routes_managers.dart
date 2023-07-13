import 'package:ecommerce_app/presentation/screens/auth/views/login_screen.dart';
import 'package:ecommerce_app/presentation/screens/auth/views/register_screen.dart';
import 'package:ecommerce_app/presentation/screens/language/views/language_screen.dart';
import 'package:ecommerce_app/presentation/screens/onboarding/views/onboarding_screen.dart';
import 'package:ecommerce_app/presentation/screens/splash/splash_view.dart';
import 'package:flutter/material.dart';


class Routes {
  static const String splashRoute = '/';
  static const String onboardingRoute = '/onboardingRoute';
  static const String languageRoute = '/languageRoute';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String homeRoute = '/home';
  static const String bottomNav = '/bottomNav';
  static const String forgotPasswordRoute = '/forgotPasswor';
  static const String mainRoute = '/main';
  static const String profileRoute = '/profile';
  static const String preConsultingRoute = '/preConsulting';
}

class RoutesGenerator {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.languageRoute:
        return MaterialPageRoute(builder: (_) => const LanguageView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
        case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      // case Routes.forgotPasswordRoute:
      //   return MaterialPageRoute(builder: (_) => const ForgetPassword());
      // case Routes.registerRoute:
      //   return MaterialPageRoute(builder: (_) => const RegisterView());
      // case Routes.bottomNav:
      //   return MaterialPageRoute(builder: (_) => const BottomNavView());
      // case Routes.homeRoute:
      //   return MaterialPageRoute(builder: (_) => const HomeViews());
      // case Routes.preConsultingRoute:
      //   return MaterialPageRoute(builder: (_) => const PreConsultingView());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('NotDefinedRoute'),
          ),
          body: const Center(child: Text('NotDefinedRoute')),
        ));
  }
}
