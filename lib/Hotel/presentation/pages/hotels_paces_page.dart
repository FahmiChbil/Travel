import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/all_hotels.dart';
import 'package:mylasttravelapp/Hotel/presentation/pages/first_page.dart';
import 'package:mylasttravelapp/Hotel/presentation/pages/hotel_detail_page.dart';

class HotelsPlacePage extends StatelessWidget {
  final AllHotels allHotels;

  const HotelsPlacePage({required this.allHotels, super.key});

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
              child: const Icon(Icons.arrow_back),
            ),
          ),
          title: Text(allHotels.allhotels.first.placeName),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Hotel",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: HexColor('ff6b01')),
                  ),
                ],
              ),
              SizedBox(
                height: 500.h,
                child: GridView.count(
                  childAspectRatio: 0.8,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ...List.generate(
                      allHotels.allhotels.length,
                      (index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          GestureDetector(
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HotelDetailPage(
                                      oneHotel: allHotels.allhotels[index],
                                    ),
                                  ));
                            },
                            child: Container(
                              height: 140,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(18),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      allHotels.allhotels[index].images.first,
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            constraints: BoxConstraints(maxWidth: 140.w),
                            child: Text(
                              allHotels.allhotels[index].name,
                              maxLines: 1,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              ...List.generate(
                                  int.parse(allHotels.allhotels[index].etoiles),
                                  (index) => const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
