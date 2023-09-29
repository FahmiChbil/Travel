// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataTypeBtn extends StatelessWidget {
  DataTypeBtn({
    required this.myText,
    required this.myIcon,
    required this.onClick,
    super.key,
  });
  Widget myIcon;
  String myText;
  void Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onClick,
          child: Container(
            height: 40.h,
            width: 40.h,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 0),
                  color: Colors.grey.shade700,
                  blurRadius: 10),
            ], borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Center(child: myIcon),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          myText,
          style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
