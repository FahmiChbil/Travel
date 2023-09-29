// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class ReserveDepartDate extends StatefulWidget {
  ReserveDepartDate(
      {required this.initial,
      super.key,
      required this.myicon,
      required this.mytext1,
      required this.mytext2,
      required this.dateInput2,
      required this.dateInput1});
  final IconData myicon;
  final String mytext1;
  final String mytext2;

  DateTime? picked;
  final DateTime initial;
  TextEditingController dateInput1;
  TextEditingController dateInput2;

  DateTime? selectedDate;

  @override
  State<ReserveDepartDate> createState() => ReserveDepartDateState();
}

class ReserveDepartDateState extends State<ReserveDepartDate> {
  @override
  void initState() {
    widget.dateInput1.text = widget.mytext1;
    widget.dateInput2.text =
        widget.mytext2; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
                  DateTime? pickedDate1 = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));

                  if (pickedDate1 != null) {
                    //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate1);
                    //formatted date output using intl package =>  2021-03-16
                    setState(() {
                      widget.selectedDate = pickedDate1;

                      widget.dateInput1.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    setState(() {
                      widget.selectedDate = pickedDate1;
                    });
                  }
                },
                autofocus: true,
                child: Text(
                  widget.dateInput1.text,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ))
          ],
        ),
        Divider(
          endIndent: 10.w,
          height: 30,
          thickness: 1.5,
        ),
        Row(
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
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: widget.initial,
                      firstDate: widget.selectedDate ?? DateTime.now(),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));
                  widget.picked = pickedDate;

                  if (pickedDate != null) {
                    //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    //formatted date output using intl package =>  2021-03-16
                    setState(() {
                      widget.dateInput2.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {}
                },
                autofocus: true,
                child: Text(
                  widget.dateInput2.text,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ))
          ],
        )
      ],
    );
  }
}

class ReserveReturnDate extends StatefulWidget {
  ReserveReturnDate(
      {required this.initial,
      super.key,
      required this.myicon,
      required this.mytext,
      this.func,
      required this.firstd,
      required this.dateInput});
  final IconData myicon;
  final String mytext;
  final DateTime firstd;
  final void Function()? func;
  DateTime? picked;
  final DateTime initial;
  TextEditingController dateInput;

  @override
  State<ReserveReturnDate> createState() => ReserveReturnDateState();
}

class ReserveReturnDateState extends State<ReserveReturnDate> {
  @override
  void initState() {
    widget.dateInput.text = widget.mytext; //set the initial value of text field
    super.initState();
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
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: widget.initial,
                  firstDate: widget.firstd,
                  //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2100));
              widget.picked = pickedDate;

              if (pickedDate != null) {
                //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                //formatted date output using intl package =>  2021-03-16
                setState(() {
                  widget.dateInput.text =
                      formattedDate; //set output date to TextField value.
                });
              } else {}
            },
            autofocus: true,
            child: Text(
              widget.dateInput.text,
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
