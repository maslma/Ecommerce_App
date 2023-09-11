import 'package:ecommerce_app/data/class/crud.dart';
import 'package:ecommerce_app/data/local/chach_helper.dart';
import 'package:ecommerce_app/domain/models/auth/check_email_model.dart';
import 'package:ecommerce_app/domain/models/auth/login_model.dart';
import 'package:ecommerce_app/domain/models/auth/reset_password_model.dart';
import 'package:ecommerce_app/domain/models/auth/signup_model.dart';
import 'package:ecommerce_app/domain/models/auth/verfiycode_password_model.dart';
import 'package:ecommerce_app/domain/models/auth/verify_code_signup.dart';
import 'package:ecommerce_app/presentation/presentation_managers/routes_managers.dart';
import 'package:ecommerce_app/presentation/presentation_managers/string_manager.dart';
import 'package:ecommerce_app/utities/main_function.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  StatusRequest? statusRequest;

  bool isShowPassword = true;
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    emit(AuthShowPassword());
  }

  //Login
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  TextEditingController emailLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();

  void login(BuildContext context) async {
    var formLogin = formKeyLogin.currentState;
    if (formLogin!.validate()) {
      Crud crud = Crud();
      LoginModel loginModel = LoginModel(crud);
      statusRequest = StatusRequest.loading;
      emit(AuthLoadingLoginState());
      var response =
      await loginModel.postData(emailLogin.text, passwordLogin.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          ChachHelper.sharedPreferences.setString("id", response['data']['users_id']);
          ChachHelper.sharedPreferences.setString("username", response['data']['users_name']);
          ChachHelper.sharedPreferences.setString("email", response['data']['users_email']);
          ChachHelper.sharedPreferences.setString("phone", response['data']['users_phone']);
          ChachHelper.sharedPreferences.setString("step", "2");
          Navigator.pushReplacementNamed(context, Routes.homeRoute);
          clearLoginText();
          emit(AuthSuccessLoginState());
        } else {
          checkEmailAndPhone(AppStrings.warning,
              AppStrings.emailOrPasswordNotCorrect, context);
          statusRequest = StatusRequest.failure;
          emit(AuthErrorLoginState());
        }
      }
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

  void signUp(BuildContext context) async {
    var formSignUp = formKeySignUp.currentState;
    if (formSignUp!.validate()) {
      Crud crud = Crud();
      SignUpModel signUpModel = SignUpModel(crud);
      statusRequest = StatusRequest.loading;
      emit(AuthLoadingCreateUserState());
      var response = await signUpModel.postData(fullNameSignUp.text,
          passwordSignUp.text, emailSignUp.text, phoneSignUp.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Navigator.pushReplacementNamed(
              context, Routes.verifyCodeRegisterRoute,
              arguments: {"email": emailSignUp.text});
          emit(AuthSuccessCreateUserState());
        }
      } else {
        checkEmailAndPhone(
            AppStrings.warning, AppStrings.phoneOrEmailAlready, context);
        statusRequest = StatusRequest.failure;
        emit(AuthErrorCreateUserState());
      }
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
  TextEditingController emailForgetPassword = TextEditingController();

  void forgetPassword(BuildContext context) async {
    var formForgetPassword = formKeyForgetPassword.currentState;
    if (formForgetPassword!.validate()) {
      Crud crud = Crud();
      CheckEmailModel checkEmailModel = CheckEmailModel(crud);
      statusRequest = StatusRequest.loading;
      emit(AuthLoadingCheckEmailState());
      var response = await checkEmailModel.postData(emailForgetPassword.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Navigator.pushReplacementNamed(context, Routes.verifyCodeRoute,
              arguments: {"email": emailForgetPassword.text});
          emit(AuthSuccessCheckEmailState());
        } else {
          checkEmailAndPhone(
              AppStrings.warning, AppStrings.emailNotFound, context);
          statusRequest = StatusRequest.failure;
          emit(AuthErrorCheckEmailState());
        }
      }
    }
  }

  void clearForgetPasswordText() {
    emailForgetPassword.clear();
  }

  //VerifyCodeSignup

  void goToSuccessSignUp(BuildContext context, String verificationCode) async {
    Crud crud = Crud();
    VerifyCodeSignUpModel verifyCodeSignUpModel = VerifyCodeSignUpModel(crud);
    statusRequest = StatusRequest.loading;
    emit(AuthLoadingVerifyCoState());
    var response = await verifyCodeSignUpModel.postData(
        emailSignUp.text, verificationCode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Navigator.pushReplacementNamed(context, Routes.successRegisterRoute);
        clearSignUpText();
        emit(AuthSuccessVerifyCoState());
      } else {
        checkEmailAndPhone(
            AppStrings.warning, AppStrings.verifyNotCorrect, context);
        statusRequest = StatusRequest.failure;
        emit(AuthErrorVerifyCoState());
      }
    }
  }

  //VerifyCodeForgetPassword

  void goToSuccessVerifyCodeForgetPassword(
      BuildContext context, String verificationCode) async {
    Crud crud = Crud();
    VerifyCodePasswordModel verifyCodePasswordModel =
    VerifyCodePasswordModel(crud);
    statusRequest = StatusRequest.loading;
    emit(AuthLoadingVerifyCodeForgetPasswordState());
    var response = await verifyCodePasswordModel.postData(
        emailForgetPassword.text, verificationCode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Navigator.pushReplacementNamed(context, Routes.resetPasswordRoute,
            arguments: {"email": emailForgetPassword.text});
        emit(AuthSuccessVerifyCodeForgetPasswordState());
      } else {
        checkEmailAndPhone(
            AppStrings.warning, AppStrings.verifyNotCorrect, context);
        statusRequest = StatusRequest.failure;
        emit(AuthErrorVerifyCodeForgetPasswordState());
      }
    }
  }

  //Reset Password
  GlobalKey<FormState> formKeyResetPassword = GlobalKey<FormState>();
  TextEditingController passwordResetPassword = TextEditingController();
  TextEditingController confirmPasswordResetPassword = TextEditingController();

  void resetPassword(BuildContext context) async {
    if (passwordResetPassword.text != confirmPasswordResetPassword.text) {
      return  checkEmailAndPhone(
          AppStrings.warning, AppStrings.passwordNotMatch, context);
    }
    var formResetPassword = formKeyResetPassword.currentState;
    if (formResetPassword!.validate()) {
      Crud crud = Crud();
      ResetPasswordModel resetPasswordModel = ResetPasswordModel(crud);
      statusRequest = StatusRequest.loading;
      emit(AuthLoadingResetPasswordState());
      var response = await resetPasswordModel.postData(
          emailForgetPassword.text, passwordResetPassword.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Navigator.pushReplacementNamed(context, Routes.successResetRoute);
          clearResetPasswordText();
          clearForgetPasswordText();
          emit(AuthSuccessResetPasswordState());
        } else {
          checkEmailAndPhone(
              AppStrings.warning, AppStrings.tryAgain, context);
          statusRequest = StatusRequest.failure;
          emit(AuthErrorResetPasswordState());
        }
      }
    }
  }

  void clearResetPasswordText() {
    passwordResetPassword.clear();
    confirmPasswordResetPassword.clear();
  }
}