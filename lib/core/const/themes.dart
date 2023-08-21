import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

final appTheme = ThemeData(
    scaffoldBackgroundColor: HexColor("018a78"),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        fixedSize: Size(300.w, 50.h),
        backgroundColor: HexColor('ff6b01'),
      ),
    ),
    primaryColor: HexColor("018a78"),
    primarySwatch: Colors.blue);
