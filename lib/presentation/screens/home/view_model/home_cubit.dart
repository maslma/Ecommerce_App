import 'package:ecommerce_app/data/local/chach_helper.dart';
import 'package:ecommerce_app/presentation/screens/home/view_model/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);


 String? username=ChachHelper.sharedPreferences.getString("username");
 String? id=ChachHelper.sharedPreferences.getString("id");

}
