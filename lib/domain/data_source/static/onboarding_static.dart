import 'package:ecommerce_app/domain/models/onboarding/onboarding_model.dart';
import 'package:ecommerce_app/presentation/presentation_managers/assets_managers.dart';
import 'package:ecommerce_app/presentation/presentation_managers/string_manager.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: AppStrings.chooseProduct,
      body:AppStrings.chooseEcommerceShop,
      image: ImageAssets.onBoardingOne),
  OnBoardingModel(
      title: AppStrings.easyPayment,
      body:AppStrings.checkoutSafePayment,
      image: ImageAssets.onBoardingTwo),
  OnBoardingModel(
      title: AppStrings.trackYourOrder,
      body:AppStrings.trackerOrder,
      image: ImageAssets.onBoardingThree),
];