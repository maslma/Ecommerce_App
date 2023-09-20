import 'package:ecommerce_app/presentation/presentation_managers/color_managers.dart';
import 'package:ecommerce_app/presentation/screens/home/view_model/home_cubit.dart';
import 'package:ecommerce_app/presentation/screens/home/view_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
              body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: ListView(children: [
                Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              hintText: "Find Product",
                              hintStyle: TextStyle(fontSize: 18.sp),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.r)),
                              filled: true,
                              fillColor: Colors.grey[200]),
                        )),
                        SizedBox(width: 10.w),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10.r)),
                          width: 60.w,
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.notifications_active_outlined,
                                size: 30.sp,
                                color: Colors.grey[600],
                              )),
                        )
                      ],
                    )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15.h),
                  child: Stack(children: [
                    Container(
                      alignment: Alignment.center,
                      child: ListTile(
                        title: Text("A summer surprise",
                            style: TextStyle(
                                color: ColorManager.white, fontSize: 20.sp)),
                        subtitle: Text("Cashback 20%",
                            style: TextStyle(
                                color: ColorManager.white, fontSize: 30.sp)),
                      ),
                      height: 150.h,
                      decoration: BoxDecoration(
                          color: ColorManager.primaryColor,
                          borderRadius: BorderRadius.circular(20.r)),
                    ),
                    Positioned(
                      top: -20,
                      right: -20,
                      child: Container(
                        height: 160.h,
                        width: 160.w,
                        decoration: BoxDecoration(
                            color: ColorManager.secoundColor,
                            borderRadius: BorderRadius.circular(160.r)),
                      ),
                    )
                  ]),
                ),

              ]),
            ),
          ));
        });
  }
}
