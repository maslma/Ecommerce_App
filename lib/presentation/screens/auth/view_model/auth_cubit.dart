import 'package:ecommerce_app/presentation/presentation_managers/routes_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  bool isShowPassword = true;

  showPassword(){
    isShowPassword = isShowPassword == true ? false : true ;
    emit(AuthShowPassword());
  }


  //Login
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  TextEditingController phoneLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();

  void login(BuildContext context) {
    var formLogin = formKeyLogin.currentState;
    if(formLogin!.validate()){
      clearLoginText();
    }else{
      print("Not Vaild");
    }
  }

  void clearLoginText() {
    phoneLogin.clear();
    passwordLogin.clear();
  }

  //SignUp
  GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
  TextEditingController fullNameSignUp = TextEditingController();
  TextEditingController phoneSignUp = TextEditingController();
  TextEditingController passwordSignUp = TextEditingController();

  void signUp(BuildContext context) {
    var formSignUp = formKeySignUp.currentState;
    if(formSignUp!.validate()){
      clearSignUpText();
      Navigator.pushReplacementNamed(context, Routes.verifyCodeRegisterRoute);
    }else{
      print("Not Vaild");
    }
  }

  void clearSignUpText() {
    fullNameSignUp.clear();
    passwordSignUp.clear();
    phoneSignUp.clear();
  }

  //ForgetPassword
  GlobalKey<FormState> formKeyForgetPassword = GlobalKey<FormState>();
  TextEditingController phoneForgetPassword = TextEditingController();

  void forgetPassword(BuildContext context) {
    var formForgetPassword = formKeyForgetPassword.currentState;
    if(formForgetPassword!.validate()){
      clearForgetPasswordText();
      Navigator.pushReplacementNamed(context, Routes.verifyCodeRoute);
    }else{
      print("Not Vaild");
    }
  }
  void clearForgetPasswordText() {
    phoneForgetPassword.clear();
  }

  //VerifyCode

  String? verifyCode;

  //Reset Password
  GlobalKey<FormState> formKeyResetPassword = GlobalKey<FormState>();
  TextEditingController passwordResetPassword = TextEditingController();
  TextEditingController confirmPasswordResetPassword = TextEditingController();

  void resetPassword(BuildContext context) {
    var formResetPassword = formKeyResetPassword.currentState;
    if(formResetPassword!.validate()){
      clearResetPasswordText();
      Navigator.pushReplacementNamed(context, Routes.successResetRoute);
    }else{
      print("Not Vaild");
    }
  }

  void clearResetPasswordText() {
    passwordResetPassword.clear();
    confirmPasswordResetPassword.clear();
  }
}
