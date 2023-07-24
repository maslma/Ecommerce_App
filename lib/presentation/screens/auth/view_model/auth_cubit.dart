import 'package:ecommerce_app/data/class/crud.dart';
import 'package:ecommerce_app/domain/models/auth/signup_model.dart';
import 'package:ecommerce_app/presentation/presentation_managers/routes_managers.dart';
import 'package:ecommerce_app/utities/main_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  bool isShowPassword = true;
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    emit(AuthShowPassword());
  }

  //Login
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  TextEditingController emailLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();

  void login(BuildContext context) {
    var formLogin = formKeyLogin.currentState;
    if (formLogin!.validate()) {
      clearLoginText();
    } else {
      print("Not Vaild");
    }
  }

  void clearLoginText() {
    emailLogin.clear();
    passwordLogin.clear();
  }

  //SignUp
  GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
  TextEditingController fullNameSignUp = TextEditingController();
  TextEditingController emailSignUp = TextEditingController();
  TextEditingController phoneSignUp = TextEditingController();
  TextEditingController passwordSignUp = TextEditingController();

  StatusRequest? statusRequest;

  void signUp(BuildContext context) async {
    var formSignUp = formKeySignUp.currentState;
    if (formSignUp!.validate()) {
      Crud crud = Crud();
      SignUpModel signUpModel = SignUpModel(crud);
      statusRequest = StatusRequest.loading;
      var response = await signUpModel.postData(fullNameSignUp.text,
          passwordSignUp.text, emailSignUp.text, phoneSignUp.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          clearSignUpText();
          Navigator.pushReplacementNamed(
              context, Routes.verifyCodeRegisterRoute);
        }
       }else{
        checkEmailAndPhone(context: context);
        statusRequest = StatusRequest.failure;
      }
      emit(AuthCreateUserState());
    }
  }

  void clearSignUpText() {
    fullNameSignUp.clear();
    emailSignUp.clear();
    passwordSignUp.clear();
    phoneSignUp.clear();
  }

  //ForgetPassword
  GlobalKey<FormState> formKeyForgetPassword = GlobalKey<FormState>();
  TextEditingController phoneForgetPassword = TextEditingController();

  void forgetPassword(BuildContext context) {
    var formForgetPassword = formKeyForgetPassword.currentState;
    if (formForgetPassword!.validate()) {
      clearForgetPasswordText();
      Navigator.pushReplacementNamed(context, Routes.verifyCodeRoute);
    } else {
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
    if (formResetPassword!.validate()) {
      clearResetPasswordText();
      Navigator.pushReplacementNamed(context, Routes.successResetRoute);
    } else {
      print("Not Vaild");
    }
  }

  void clearResetPasswordText() {
    passwordResetPassword.clear();
    confirmPasswordResetPassword.clear();
  }
}
