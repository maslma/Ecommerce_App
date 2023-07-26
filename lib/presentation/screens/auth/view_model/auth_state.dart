part of 'auth_cubit.dart';

@immutable
abstract class AuthState{}

class AuthInitial extends AuthState{}

class AuthShowPassword extends AuthState{}
//SingUp
class AuthLoadingCreateUserState extends AuthState{}
class AuthSuccessCreateUserState extends AuthState{}
class AuthErrorCreateUserState extends AuthState{}
//verifyCodeSignUp
class AuthLoadingVerifyCoState extends AuthState{}
class AuthSuccessVerifyCoState extends AuthState{}
class AuthErrorVerifyCoState extends AuthState{}