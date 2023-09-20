import 'package:ecommerce_app/data/class/crud.dart';
import 'package:ecommerce_app/presentation/presentation_managers/constancts_manager.dart';

class CheckEmailModel{
  Crud crud ;
  CheckEmailModel(this.crud);

  postData(String email) async {
    var response = await crud.postData(AppConst.checkEmail, {
      "email" : email ,
    });
    return response.fold((l) => l, (r) => r);
  }
}