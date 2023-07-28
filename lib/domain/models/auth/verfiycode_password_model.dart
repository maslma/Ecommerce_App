import 'package:ecommerce_app/data/class/crud.dart';
import 'package:ecommerce_app/presentation/presentation_managers/constancts_manager.dart';

class VerifyCodePasswordModel{
  Crud crud ;
  VerifyCodePasswordModel(this.crud);

  postData(String email,String verfiycode ) async {
    var response = await crud.postData(AppConst.verifyCodePassword, {
      "email" : email ,
      "verfiycode" : verfiycode ,
    });
    return response.fold((l) => l, (r) => r);
  }
}