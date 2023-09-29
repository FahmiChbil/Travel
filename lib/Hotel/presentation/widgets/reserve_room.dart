// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class ReserveRoom extends StatefulWidget {
  ReserveRoom(
      {required this.controller,
      required this.myicon,
      required this.mytext,
      required this.persontype,
      this.func,
      super.key});

  final IconData myicon;
  final String mytext;
  final String persontype;

  final void Function()? func;
  TextEditingController controller;
  var number = "number of";

  @override
  State<ReserveRoom> createState() => _ReserveRoomState();
}

class _ReserveRoomState extends State<ReserveRoom> {
  @override
  void initState() {
    widget.number = "";
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
              color: HexColor('e7f7f4'),
              borderRadius: BorderRadius.circular(13)),
          child: Center(
            child: Icon(
              widget.myicon,
              color: HexColor('7bc3b8'),
            ),
          ),
        ),
        SizedBox(
          width: 25.w,
        ),
        TextButton(
            onPressed: () async {
              final numb = await showDialog<String>(
                context: context,
                builder: (context) => AlertDialog(
                  elevation: 0.8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  title: Text(" ${widget.mytext}"),
                  content: TextField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: widget.controller,
                    decoration: InputDecoration(
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        label: Text(
                          "enter number of ${widget.mytext}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.sp),
                        )),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(widget.controller.text);
                        },
                        child: Text(
                          "submit",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              );
              if (numb == null || numb.isEmpty) {
                return;
              } else {
                setState(() {
                  widget.number = numb;
                });
              }
            },
            autofocus: true,
            child: Text(
              "${widget.number.toString()} ${widget.persontype} ",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(0.6),
              ),
            ))
      ],
    );
  }
}
