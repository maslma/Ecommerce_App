import 'package:ecommerce_app/data/class/handling_data_view.dart';
import 'package:ecommerce_app/presentation/presentation_managers/color_managers.dart';
import 'package:ecommerce_app/presentation/screens/test/view_model/test_cubit.dart';
import 'package:ecommerce_app/presentation/screens/test/view_model/test_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home",style: TextStyle(color: ColorManager.white),),
          centerTitle: true,
          backgroundColor: ColorManager.primaryColor,
        ),
        body: BlocConsumer<TestCubit, TestStates>(
            listener: (context, state) {},
            builder: (context, state) {
              TestCubit cubit = TestCubit.get(context);
              return HandlingDataView(
                statusRequest: cubit.statusRequest!,
                widget: ListView.builder(
                    itemCount: cubit.data.length,
                    itemBuilder: (context, index) {
                      return Text("${cubit.data}");
                    }),
              );
            }));

  }
}
