import 'package:ecommerce_app/data/class/crud.dart';
import 'package:ecommerce_app/presentation/presentation_managers/constancts_manager.dart';

class LoginModel{
  Crud crud ;
  LoginModel(this.crud);

  postData(String email,String password ) async {
    var response = await crud.postData(AppConst.login, {
      "email" : email ,
      "password" : password ,
    });
    return response.fold((l) => l, (r) => r);
  }
}