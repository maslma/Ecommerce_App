import 'package:ecommerce_app/domain/data_source/static/onboarding_static.dart';
import 'package:ecommerce_app/presentation/presentation_managers/routes_managers.dart';
import 'package:ecommerce_app/presentation/screens/onboarding/view_model/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  final PageController pageController = PageController();

  int currentPage = 0;

  void next(context) {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
      emit(OnBoardingNextState());
    }
  }

  void onPageChange(int index) {
    currentPage = index;
    emit(OnBoardingCurrentPageState());
  }
}
