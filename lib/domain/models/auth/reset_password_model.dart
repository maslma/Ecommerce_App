import 'package:ecommerce_app/data/class/crud.dart';
import 'package:ecommerce_app/presentation/presentation_managers/constancts_manager.dart';

class ResetPasswordModel{
  Crud crud ;
  ResetPasswordModel(this.crud);

  postData(String email,String password ) async {
    var response = await crud.postData(AppConst.resetPassword, {
      "email" : email ,
      "password" : password ,
    });
    return response.fold((l) => l, (r) => r);
  }
}