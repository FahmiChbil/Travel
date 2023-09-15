import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/oneHotel.dart';
import 'package:mylasttravelapp/Hotel/presentation/pages/first_page.dart';


class ReserveHotelPage extends StatelessWidget {
  ReserveHotelPage({required this.oneHotel, super.key});
  final OneHotel oneHotel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100.h,
          backgroundColor: HexColor("018a78"),
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FirstPage(),
                  ));
            },
            child: Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Icon(Icons.arrow_back),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(),
            child: Text(oneHotel.name),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          height: 70.sh,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: ListView(
            children: [
              SizedBox(
                height: 15.h,
              ),
              ReserveRoom(
                myicon: Icons.place,
                mytext: "Where",
                func: () {},
              ),
              Divider(
                endIndent: 10.w,
                height: 40,
                thickness: 1.5,
              ),
              SizedBox(
                height: 15.h,
              ),
              ReserveDepartDate(
                initial: DateTime.now(),
                myicon: Icons.calendar_month,
                mytext: "Check In",
              ),
              Divider(
                endIndent: 10.w,
                height: 40,
                thickness: 1.5,
              ),
              SizedBox(
                height: 15.h,
              ),
              ReserveDate(
                initial: DateTime.now(),
                myicon: Icons.calendar_month,
                mytext: "Check Out",
                func: () {},
              ),
              Divider(
                endIndent: 10.w,
                height: 40,
                thickness: 1.5,
              ),
              SizedBox(
                height: 15.h,
              ),
              ReserveRoom(
                myicon: Icons.person,
                mytext: "Number of adults ",
                func: () {},
              ),
              Divider(
                endIndent: 10.w,
                height: 40,
                thickness: 1.5,
              ),
              SizedBox(
                height: 15.h,
              ),
              ReserveRoom(
                myicon: Icons.person,
                mytext: "Number of children ",
                func: () {},
              ),
              Divider(
                endIndent: 10.w,
                height: 40,
                thickness: 1.5,
              ),
              SizedBox(
                height: 15.h,
              ),
              ReserveRoom(
                myicon: Icons.person,
                mytext: "Number of Rooms ",
                func: () {},
              ),
              SizedBox(
                height: 15.h,
              ),
              ElevatedButton(onPressed: () {}, child: Text("reserve")),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ));
  }
}

class ReserveDepartDate extends StatefulWidget {
  ReserveDepartDate({
    required this.initial,
    super.key,
    required this.myicon,
    required this.mytext,
    this.func,
  });
  final IconData myicon;
  final String mytext;
  final void Function()? func;
  DateTime? picked;
  final DateTime initial;

  @override
  State<ReserveDepartDate> createState() => ReserveDepartDateState();
}

class ReserveDepartDateState extends State<ReserveDepartDate> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = widget.mytext; //set the initial value of text field
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
              color: Colors.green.shade200,
              borderRadius: BorderRadius.circular(13)),
          child: Center(
            child: Icon(widget.myicon),
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
                  firstDate: DateTime(1950),
                  //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2100));
              widget.picked = pickedDate;

              if (pickedDate != null) {
                print(
                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                print(
                    formattedDate); //formatted date output using intl package =>  2021-03-16
                setState(() {
                  dateInput.text =
                      formattedDate; //set output date to TextField value.
                });
              } else {}
            },
            autofocus: true,
            child: Text(
              dateInput.text,
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

class ReserveDate extends StatefulWidget {
  ReserveDate({
    required this.initial,
    super.key,
    required this.myicon,
    required this.mytext,
    this.func,
  });
  final IconData myicon;
  final String mytext;
  final void Function()? func;
  DateTime? picked;
  final DateTime initial;

  @override
  State<ReserveDate> createState() => _ReserveDateState();
}

class _ReserveDateState extends State<ReserveDate> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = widget.mytext; //set the initial value of text field
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
              color: Colors.green.shade200,
              borderRadius: BorderRadius.circular(13)),
          child: Center(
            child: Icon(widget.myicon),
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
                  firstDate: DateTime(1950),
                  //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2100));

              if (pickedDate != null) {
                widget.picked = pickedDate;
                print(
                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                print(
                    formattedDate); //formatted date output using intl package =>  2021-03-16
                setState(() {
                  dateInput.text =
                      formattedDate; //set output date to TextField value.
                });
              } else {}
            },
            autofocus: true,
            child: Text(
              dateInput.text,
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

class ReserveRoom extends StatefulWidget {
  ReserveRoom(
      {required this.myicon, required this.mytext, this.func, super.key});

  final IconData myicon;
  final String mytext;
  final void Function()? func;
  var number;

  @override
  State<ReserveRoom> createState() => _ReserveRoomState();
}

class _ReserveRoomState extends State<ReserveRoom> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    widget.number = widget.mytext;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
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
              color: Colors.green.shade200,
              borderRadius: BorderRadius.circular(13)),
          child: Center(
            child: Icon(widget.myicon),
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
                  title: Text(" ${widget.number}"),
                  content: TextField(
                    controller: controller,
                    decoration:
                        InputDecoration(label: Text("enter number of adults")),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(controller.text);
                        },
                        child: Text("submit"))
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
              widget.number.toString(),
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
