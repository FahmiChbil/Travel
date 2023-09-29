import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {required this.myValidator,
      required this.myHint,
      required this.myLabel,
      required this.formatters,
      required this.myContoller,
      super.key});
  final String? Function(String?)? myValidator;
  final String myHint;
  final String myLabel;
  final TextEditingController myContoller;
  final List<TextInputFormatter>? formatters;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      validator: myValidator,
      controller: myContoller,
      autovalidateMode: AutovalidateMode.always,
      inputFormatters: formatters,
      decoration: InputDecoration(
          hintText: myHint,
          labelText: myLabel,
          labelStyle: const TextStyle(color: Colors.black),
          enabled: true,
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: HexColor('ff6b01'), width: 3)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: HexColor('ff6b01'), width: 3)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: HexColor('ff6b01'), width: 3)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: HexColor('ff6b01'), width: 3))),
    );
  }
}
