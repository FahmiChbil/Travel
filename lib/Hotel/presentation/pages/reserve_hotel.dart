import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:mylasttravelapp/Hotel/domain/entities/one_hotel.dart';
import 'package:mylasttravelapp/Hotel/presentation/Cubit/cubit/pay_cubit_cubit.dart';
import 'package:mylasttravelapp/Hotel/presentation/pages/chat_page.dart';

import 'package:mylasttravelapp/Hotel/presentation/widgets/reserve_depart_data.dart';
import 'package:mylasttravelapp/Hotel/presentation/widgets/reserve_room.dart';

class ReserveHotelPage extends StatefulWidget {
  const ReserveHotelPage({required this.oneHotel, super.key});
  final OneHotel oneHotel;

  @override
  State<ReserveHotelPage> createState() => _ReserveHotelPageState();
}

class _ReserveHotelPageState extends State<ReserveHotelPage> {
  double price = 0;

  TextEditingController checkIncontrol = TextEditingController();

  TextEditingController checkOutcontrol = TextEditingController();

  TextEditingController adultnbr = TextEditingController();

  TextEditingController childrennbr = TextEditingController();

  TextEditingController roomnbr = TextEditingController();

  TextEditingController where = TextEditingController();

  DateTime? selectedDate;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 100.h,
          backgroundColor: HexColor("018a78"),
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: const Icon(Icons.arrow_back),
            ),
          ),
          title: Text(widget.oneHotel.name),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(),
                      ));
                },
                icon: const Icon(Icons.chat)),
          ],
        ),
        body: Container(
          width: double.infinity,
          height: 70.sh,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Form(
              child: Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              ReserveDepartDate(
                dateInput1: checkIncontrol,
                dateInput2: checkOutcontrol,
                initial: DateTime.now(),
                myicon: Icons.calendar_month,
                mytext1: "Check In",
                mytext2: "check Out",
              ),
              Divider(
                endIndent: 10.w,
                height: 30,
                thickness: 1.5,
              ),
              ReserveRoom(
                persontype: "Adult",
                controller: adultnbr,
                myicon: Icons.person,
                mytext: "Number of adults ",
                func: () {},
              ),
              Divider(
                endIndent: 10.w,
                height: 30,
                thickness: 1.5,
              ),
              ReserveRoom(
                persontype: "Children",
                controller: childrennbr,
                myicon: Icons.person,
                mytext: "Number of children ",
                func: () {},
              ),
              Divider(
                endIndent: 10.w,
                height: 30,
                thickness: 1.5,
              ),
              ReserveRoom(
                persontype: "Room",
                controller: roomnbr,
                myicon: Icons.person,
                mytext: "Number of Rooms ",
                func: () {},
              ),
              SizedBox(
                height: 40.h,
              ),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    if (roomnbr.text.isNotEmpty &&
                        adultnbr.text.isNotEmpty &&
                        childrennbr.text.isNotEmpty &&
                        checkOutcontrol.text != "check Out" &&
                        checkIncontrol.text != "Check In") {
                      price = double.parse(adultnbr.text) *
                              double.parse(widget.oneHotel.prix) +
                          double.parse(childrennbr.text) *
                              double.parse(widget.oneHotel.prix) /
                              2;

                      // PaymentManager.makePayment(price.round(), "USD");
                      context
                          .read<PayCubitCubit>()
                          .payHotel(price.toInt(), "USD");
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                          content: Text("pleaase enter required data"),
                        ),
                      );
                    }
                  },
                  child: const Text("reserve")),
              SizedBox(
                height: 15.h,
              ),
            ],
          )),
        ));
  }
}
