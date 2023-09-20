import 'package:ecommerce_app/data/class/crud.dart';
import 'package:ecommerce_app/presentation/presentation_managers/constancts_manager.dart';

class HomeData{
  Crud crud ;
  HomeData(this.crud);

  getData()async {
    var response = await crud.postData(AppConst.homePage, {});
    return response.fold((l) => l, (r) => r);
  }
}