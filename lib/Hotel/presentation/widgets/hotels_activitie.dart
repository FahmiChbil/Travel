import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelActivitie extends StatelessWidget {
  HotelActivitie(
      {required this.mycolor,
      required this.myText,
      required this.myIcon,
      super.key});
  Widget myIcon;
  String myText;
  Color mycolor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40.h,
          width: 40.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: mycolor),
          child: Center(child: myIcon),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          myText,
          style: TextStyle(
              fontSize: 12.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
