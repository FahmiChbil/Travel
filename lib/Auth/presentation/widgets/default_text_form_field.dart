import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class DefaultTextFomField extends StatelessWidget {
  const DefaultTextFomField({
    super.key,
    required this.emailcontroller,
    required this.myHint,
    required this.myLabel,
    required this.myvalidator,
    required this.obs,
    required this.suff,
  });

  final TextEditingController emailcontroller;
  final String myHint;
  final String myLabel;
  final String? Function(String?) myvalidator;
  final bool obs;
  final Widget? suff;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: TextFormField(
        obscureText: obs,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          suffix: suff,
          errorStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
          hintText: myHint,
          labelText: myLabel,
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(5)),
          labelStyle: const TextStyle(color: Colors.black),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: HexColor('ff6b01'), width: 2),
              borderRadius: BorderRadius.circular(5)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: HexColor('ff6b01'), width: 2),
              borderRadius: BorderRadius.circular(5)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: HexColor('ff6b01'), width: 2),
              borderRadius: BorderRadius.circular(5)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: HexColor('ff6b01'), width: 2),
              borderRadius: BorderRadius.circular(5)),
        ),
        // The validator receives the text that the user has entered.
        validator: myvalidator,
        controller: emailcontroller,
      ),
    );
  }
}
