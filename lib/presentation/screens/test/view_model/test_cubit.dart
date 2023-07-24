import 'package:ecommerce_app/data/class/crud.dart';
import 'package:ecommerce_app/domain/models/test_model.dart';
import 'package:ecommerce_app/presentation/screens/test/view_model/test_state.dart';
import 'package:ecommerce_app/utities/main_function.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestCubit extends Cubit<TestStates> {
  TestCubit() : super(TestInitialState());

  static TestCubit get(context) => BlocProvider.of(context);


  List data = [];
  StatusRequest? statusRequest ;

  getData() async{
    Crud crud = Crud();
    TestModel testData = TestModel(crud);
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    print("================================= $response =======================");
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        data.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    emit(GetDataState());
  }

}
