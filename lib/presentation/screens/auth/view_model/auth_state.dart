part of 'auth_cubit.dart';

@immutable
abstract class AuthState{}

class AuthInitial extends AuthState{}

class AuthShowPassword extends AuthState{}

class AuthCreateUserState extends AuthState{}