import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  //Login
TextEditingController phoneLogin = TextEditingController();
TextEditingController passwordLogin = TextEditingController();

  void clearLoginText() {
    phoneLogin.clear();
    passwordLogin.clear();
  }
  //SignUp
  TextEditingController fullNameSignUp = TextEditingController();
  TextEditingController phoneSignUp = TextEditingController();
  TextEditingController passwordSignUp  = TextEditingController();

  void clearSignUpText() {
    fullNameSignUp.clear();
    passwordSignUp.clear();
    phoneSignUp .clear();
  }
}