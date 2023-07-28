part of 'auth_cubit.dart';

@immutable
abstract class AuthState{}

class AuthInitial extends AuthState{}

class AuthShowPassword extends AuthState{}
//SingUp
class AuthLoadingCreateUserState extends AuthState{}
class AuthSuccessCreateUserState extends AuthState{}
class AuthErrorCreateUserState extends AuthState{}
//Login
class AuthLoadingLoginState extends AuthState{}
class AuthSuccessLoginState extends AuthState{}
class AuthErrorLoginState extends AuthState{}
//verifyCodeSignUp
class AuthLoadingVerifyCoState extends AuthState{}
class AuthSuccessVerifyCoState extends AuthState{}
class AuthErrorVerifyCoState extends AuthState{}
//forgetPassword
class AuthLoadingCheckEmailState extends AuthState{}
class AuthSuccessCheckEmailState extends AuthState{}
class AuthErrorCheckEmailState extends AuthState{}
//VerifyCodeForgetPassword
class AuthLoadingVerifyCodeForgetPasswordState extends AuthState{}
class AuthSuccessVerifyCodeForgetPasswordState extends AuthState{}
class AuthErrorVerifyCodeForgetPasswordState extends AuthState{}
//resetPasswordModel
class AuthLoadingResetPasswordState extends AuthState{}
class AuthSuccessResetPasswordState extends AuthState{}
class AuthErrorResetPasswordState extends AuthState{}