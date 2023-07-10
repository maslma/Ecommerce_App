import 'package:ecommerce_app/domain/models/onboarding_model.dart';
import 'package:ecommerce_app/presentation/presentation_managers/assets_managers.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "Choose Product",
      body:
      "We Have a 100k Product , Choose \n Your Product From  Our \n E-commerce Shop",
      image: ImageAssets.onBoardingOne),
  OnBoardingModel(
      title: "Easy And Safe Payment",
      body:
      "Easy Checkout & Safe Payment \n method. Trusted by our Customers \n from all over the world.",
      image: ImageAssets.onBoardingTwo),
  OnBoardingModel(
      title: "Track Your Order",
      body:
      "Best Tracker has been Used For \n Track your order. You\'ll know where \n you products at the moment",
      image: ImageAssets.onBoardingThree),
];