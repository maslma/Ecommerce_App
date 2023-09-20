import 'package:ecommerce_app/data/class/crud.dart';
import 'package:ecommerce_app/presentation/presentation_managers/constancts_manager.dart';

class VerifyCodeSignUpModel{
  Crud crud ;
  VerifyCodeSignUpModel(this.crud);

  postData(String email ,String verifyCode ) async {
    var response = await crud.postData(AppConst.verifyCode, {
     "email" : email ,
      "verfiycode" : verifyCode
    });
    return response.fold((l) => l, (r) => r);
  }
}