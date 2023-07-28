import 'package:ecommerce_app/presentation/screens/auth/views/forget_password.dart';
import 'package:ecommerce_app/presentation/screens/auth/views/login_screen.dart';
import 'package:ecommerce_app/presentation/screens/auth/views/register_screen.dart';
import 'package:ecommerce_app/presentation/screens/auth/views/reset_password.dart';
import 'package:ecommerce_app/presentation/screens/auth/views/success_register.dart';
import 'package:ecommerce_app/presentation/screens/auth/views/success_reset_password.dart';
import 'package:ecommerce_app/presentation/screens/auth/views/verify_code.dart';
import 'package:ecommerce_app/presentation/screens/auth/views/verify_code_register.dart';
import 'package:ecommerce_app/presentation/screens/home/views/home_view.dart';
import 'package:ecommerce_app/presentation/screens/language/views/language_screen.dart';
import 'package:ecommerce_app/presentation/screens/onboarding/views/onboarding_screen.dart';
import 'package:ecommerce_app/presentation/screens/splash/splash_view.dart';
import 'package:flutter/material.dart';


class Routes {
  static const String splashRoute = '/';
  static const String onboardingRoute = '/onboardingRoute';
  static const String languageRoute = '/languageRoute';
  //Auth
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgetPassword';
  static const String resetPasswordRoute = '/resetPassword';
  static const String verifyCodeRoute = '/verifyCode';
  static const String verifyCodeRegisterRoute = '/verifyCodeRegister';
  static const String successResetRoute = '/successReset';
  static const String successRegisterRoute = '/successRegister';
  //Home
  static const String homeRoute = '/home';
  static const String bottomNav = '/bottomNav';
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
        //Auth
      case Routes.languageRoute:
        return MaterialPageRoute(builder: (_) => const LanguageView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
        case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case Routes.resetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ResetPasswordView());
      case Routes.verifyCodeRoute:
        return MaterialPageRoute(builder: (_) => const VerifyCodeView());
      case Routes.successResetRoute:
        return MaterialPageRoute(builder: (_) => const SuccessResetPassword());
      case Routes.successRegisterRoute:
        return MaterialPageRoute(builder: (_) => const SuccessRegister());
        case Routes.verifyCodeRegisterRoute:
        return MaterialPageRoute(builder: (_) => const VerifyCodeRegister());
        //Home
        case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());

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
