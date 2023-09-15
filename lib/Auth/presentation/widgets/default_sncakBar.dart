// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SnackBar defaultSnack(String mytext, Color myColor) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
    backgroundColor: myColor,
    duration: const Duration(seconds: 2),
    content: Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      child: Text(
        mytext,
      ),
    ),
  );
}
