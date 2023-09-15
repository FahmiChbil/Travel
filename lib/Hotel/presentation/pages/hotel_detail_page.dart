import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/oneHotel.dart';
import 'package:mylasttravelapp/Hotel/presentation/pages/reserve_hotel.dart';
import 'package:mylasttravelapp/Hotel/presentation/widgets/caroussel.dart';
import 'package:mylasttravelapp/Hotel/presentation/widgets/data_type-btn.dart';

import '../widgets/hotels_activitie.dart';

class HotelDetailPage extends StatelessWidget {
  const HotelDetailPage({super.key, required this.oneHotel});

  static String id = "/hotelroute";

  final OneHotel oneHotel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            child: CarouselWithIndicatorDemo(
              imgs: oneHotel.images,
              hotelname: oneHotel.name,
            ),
          ),
          Positioned(
            top: 300.h,
            left: 1,
            right: 1,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(18),
                      topLeft: Radius.circular(18))),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "(${oneHotel.note})",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Row(
                              children: [
                                ...List.generate(
                                    int.parse(oneHotel.etoiles),
                                    (index) => Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ))
                              ],
                            )
                          ],
                        ),
                        Text(
                          "See Review",
                          style: TextStyle(
                              color: HexColor('ff6b01'),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.3),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(
                      color: Colors.grey,
                      endIndent: 5,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Text(
                      "information",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      oneHotel.info,
                      maxLines: 4,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, height: 1.5),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HotelActivitie(
                          mycolor: HexColor('eeecff'),
                          myIcon: const Icon(
                            Icons.dining,
                            color: Colors.deepPurple,
                          ),
                          myText: "Dining",
                        ),
                        HotelActivitie(
                            mycolor: HexColor('fec8b6'),
                            myIcon: const Icon(
                              Icons.pool,
                              color: Colors.orange,
                            ),
                            myText: "Pool"),
                        HotelActivitie(
                            mycolor: HexColor('#ccfbfd'),
                            myIcon: Icon(
                              Icons.local_parking,
                              color: Colors.green.shade200,
                            ),
                            myText: "Parking"),
                        HotelActivitie(
                          mycolor: HexColor('ffeead'),
                          myIcon: Icon(
                            Icons.wifi,
                            color: Colors.green.shade200,
                          ),
                          myText: "Wifi",
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const Text(
                      "Activities : ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      constraints: BoxConstraints(maxWidth: 200.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ...List.generate(
                              oneHotel.activities.length,
                              (index) => Chip(
                                  backgroundColor: Colors.grey.shade200,
                                  elevation: 2,
                                  padding: EdgeInsets.all(3),
                                  label: Text(oneHotel.activities[index])))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ReserveHotelPage(oneHotel: oneHotel),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            fixedSize: Size(300.w, 50.h)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Start ${oneHotel.prix}",
                              style: TextStyle(fontSize: 13.sp),
                            ),
                            Text(
                              "select room",
                              style: TextStyle(fontSize: 13.sp),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: 30.h,
              left: 20.w,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ))
        ],
      ),
    );
  }
}
