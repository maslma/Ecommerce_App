import 'package:ecommerce_app/data/class/crud.dart';
import 'package:ecommerce_app/domain/data_source/home_data.dart';
import 'package:ecommerce_app/presentation/screens/home/view_model/home_state.dart';
import 'package:ecommerce_app/utities/main_function.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);


  List categories = [];
  List items = [];


  StatusRequest? statusRequest ;

  getData() async{
    Crud crud = Crud();
    HomeData testData = HomeData(crud);
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    print("================================= $response =======================");
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        categories.addAll(response['categories']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    emit(GetDataState());
  }

 //
 // String? username=ChachHelper.sharedPreferences.getString("username");
 // String? id=ChachHelper.sharedPreferences.getString("id");

}
