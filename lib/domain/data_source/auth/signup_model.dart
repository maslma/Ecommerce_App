import 'package:ecommerce_app/data/class/crud.dart';
import 'package:ecommerce_app/presentation/presentation_managers/constancts_manager.dart';

class SignUpModel{
  Crud crud ;
  SignUpModel(this.crud);

  postData(String username ,String password ,String email ,String phone ) async {
    var response = await crud.postData(AppConst.signUp, {
      "username" : username ,
      "phone" : phone  ,
      "email" : email ,
      "password" : password ,
    });
    return response.fold((l) => l, (r) => r);
  }
}