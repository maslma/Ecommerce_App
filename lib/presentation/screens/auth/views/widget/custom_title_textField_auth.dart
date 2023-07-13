import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTitleTextField extends StatelessWidget {
  final String titleTextField ;
  const CustomTitleTextField({super.key, required this.titleTextField});

  @override
  Widget build(BuildContext context) {
    return  Text(
      titleTextField,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.start,
    );
  }
}
