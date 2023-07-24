import 'package:ecommerce_app/data/class/crud.dart';
import 'package:ecommerce_app/presentation/presentation_managers/constancts_manager.dart';

class TestModel{
  Crud crud ;
  TestModel(this.crud);

  getData()async {
    var response = await crud.postData(AppConst.test, {});
    return response.fold((l) => l, (r) => r);
  }
}