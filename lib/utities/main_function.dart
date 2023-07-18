import 'package:ecommerce_app/data/local/chach_helper.dart';
import 'package:ecommerce_app/data/localization/app_lang.dart';
import 'package:ecommerce_app/presentation/presentation_managers/color_managers.dart';
import 'package:ecommerce_app/presentation/presentation_managers/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bool isValidUsername(String val) {
  const pattern = r'^[a-zA-Z0-9_]+$';
  return RegExp(pattern).hasMatch(val);
}

bool isValidEmail(String val) {
  const pattern =
      r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.)+[a-zA-Z]{2,7}$';
  return RegExp(pattern).hasMatch(val);
}

bool isValidPhone(String val) {
  const pattern = r'^\+?[0-9]{6,}$';
  return RegExp(pattern).hasMatch(val);
}

validateInput(String val, int min, int max, String type, BuildContext context) {
  if (type == AppStrings.fullName) {
    if (!isValidUsername(val)) {
      return AppStrings.notValidUsername.tr(context);
    }
  }

  if (type == "email") {
    if (!isValidEmail(val)) {
      return AppStrings.notValidEmail.tr(context);
    }
  }

  if (type == AppStrings.phone) {
    if (!isValidPhone(val)) {
      return AppStrings.notValidPhone.tr(context);
    }
  }

  if (val.isEmpty) {
    return AppStrings.cantBeEmpty.tr(context);
  }

  if (val.length < min) {
    return "${AppStrings.cantBeLessThan.tr(context)}$min";
  }

  if (val.length > max) {
    return "${AppStrings.cantBeLargerThan.tr(context)} $max";
  }
}

Future<bool> alertExitApp(BuildContext context) async {
  bool? confirmed = await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: ColorManager.white,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.alert.tr(context),
              style: const TextStyle(
                color: ColorManager.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppStrings.doYouApplication.tr(context),
              style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(ColorManager.primaryColor),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pop(true); // Return true when confirmed
                  },
                  child: Text(
                    AppStrings.confirm.tr(context),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorManager.white,
                    ),
                  )),
              SizedBox(
                width: 4.w,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(ColorManager.primaryColor),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    AppStrings.cancel.tr(context),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorManager.white,
                    ),
                  )),
            ],
          ),
        ],
      );
    },
  );
  return confirmed ?? false; // Return false if confirmed is null
}

// navTo({
//   required String routeName,
//   required BuildContext context,
// }) {
//   Navigator.of(context).pushNamed(routeName);
// }
//
// void showToast({
//   required String text,
//   required ToastState state,
// }) {
//   Fluttertoast.showToast(
//       msg: text,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 5,
//       backgroundColor: chooseToastColor(state),
//       textColor: Colors.white,
//       fontSize: 16.0);
// }
//
// enum ToastState { SUCCESS, ERORR, WARNING }
//
// Color chooseToastColor(ToastState state) {
//   Color color;
//   switch (state) {
//     case ToastState.SUCCESS:
//       color = Colors.green;
//       break;
//     case ToastState.ERORR:
//       color = Colors.red;
//       break;
//     case ToastState.WARNING:
//       color = Colors.amber;
//       break;
//   }
//   return color;
// }
//
// Widget myDivider() =>Padding(
//   padding: const EdgeInsetsDirectional.only(
//     start:20.0,
//     end: 20.0
//   ),
//   child: Container(
//     width:double.infinity,
//     height:1.0 ,
//     color:Colors.grey[500] ,
//   ),
// );
// void navigateAndFinish(context , widget ) => Navigator.pushAndRemoveUntil(
//   context,
//
//   MaterialPageRoute(
//     builder:(context) => widget,
//   ),
//       (route){
//     return false;
//   },
// );
//
String? token = ChachHelper.getData(key: 'token');
