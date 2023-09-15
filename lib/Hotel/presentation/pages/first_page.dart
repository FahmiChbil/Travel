// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mylasttravelapp/Hotel/data/datasources/hotel_remote_datasource.dart';
import 'package:mylasttravelapp/Hotel/presentation/Cubit/cubit/all_hotels_cubit.dart';
import 'package:mylasttravelapp/Hotel/presentation/Hotels_cubit/hotels_cubit.dart';
import 'package:mylasttravelapp/Hotel/presentation/pages/hotels_paces_page.dart';
import 'package:mylasttravelapp/Hotel/presentation/widgets/data_type-btn.dart';
import 'package:mylasttravelapp/core/const/themes.dart';

class FirstPage extends StatelessWidget {
  FirstPage({super.key});
  static String id = "firstpageroute";
  List impairs = [1, 3, 5, 7, 9, 11, 13];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        backgroundColor: backColor,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 15.w, top: 20.h),
          child: GestureDetector(
            child: const Icon(Icons.menu),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 20.h, right: 15.w),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Hi ",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 18.sp,
                      ),
                    ),
                    Text(
                      "John Doe ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 35.h,
                  decoration: BoxDecoration(
                      color: HexColor('018879'),
                      border: Border.all(color: backColor),
                      borderRadius: BorderRadius.circular(7)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      const Icon(
                        Icons.search,
                        color: Colors.white24,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const SizedBox(
                        width: 200,
                        child: TextField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter name or email",
                                hintStyle: TextStyle(color: Colors.white24))),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DataTypeBtn(
                      onClick: null,
                      myIcon: const Icon(
                        Icons.flight,
                        color: Colors.deepPurple,
                      ),
                      myText: "Flight",
                    ),
                    DataTypeBtn(
                        onClick: () async {
                          context.read<HotelsCubit>().getAllplaces();
                        },
                        myIcon: const Icon(
                          Icons.hotel,
                          color: Colors.orange,
                        ),
                        myText: "Hotel"),
                    DataTypeBtn(
                        onClick: null,
                        myIcon: Icon(
                          Icons.train,
                          color: Colors.green.shade200,
                        ),
                        myText: "Train"),
                    DataTypeBtn(
                      onClick: null,
                      myIcon: Icon(
                        Icons.more_horiz_rounded,
                        color: Colors.green.shade200,
                      ),
                      myText: "More",
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
          BlocBuilder<HotelsCubit, HotelsState>(
            builder: (context, placestate) {
              if (placestate is LoadingState) {
                return Positioned(
                    top: 200.h,
                    left: 0.1,
                    right: 0.1,
                    child: Container(
                        padding: EdgeInsets.all(8.h),
                        width: 95.sw,
                        height: 95.sh,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.amber,
                          ),
                        )));
              } else if (placestate is SuccessState) {
                return Positioned(
                  top: 200.h,
                  left: 0.1,
                  right: 0.1,
                  child: Container(
                    padding: EdgeInsets.all(8.h),
                    width: 95.sw,
                    height: 95.sh,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Recommended",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "See All",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('ff6b01')),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          BlocListener<AllHotelsCubit, AllHotelsState>(
                              listener: (context, state) {
                                print("++++++++++");
                                if (state is LoadingAllHotelsState) {
                                  print(state);
                                }
                                if (state is SuccesAllHotelsState) {
                                  print(state);
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HotelsPlacePage(
                                        allHotels: state.allHotels),
                                  ));
                                }
                              },
                              child: SizedBox(
                                height: 327.h,
                                child: GridView.count(
                                  primary: false,
                                  // padding: const EdgeInsets.all(20),
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.7,
                                  physics: const BouncingScrollPhysics(),
                                  children: <Widget>[
                                    ...List.generate(
                                        placestate.allPlaces.places.length,
                                        (index) => Stack(
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    List<String> docidList =
                                                        await HotelRemoteDataSourceImpl()
                                                            .getdocsId();
                                                    print(docidList[index]);

                                                    context
                                                        .read<AllHotelsCubit>()
                                                        .getAllHotels(
                                                            docidList[index]);
                                                  },
                                                  child: Container(
                                                    height: 300.h,
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                            placestate
                                                                .allPlaces
                                                                .places[index]
                                                                .background,
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                    bottom: 7.h,
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 15.w),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Text(
                                                            placestate
                                                                .allPlaces
                                                                .places[index]
                                                                .name,
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                          Text(
                                                            "6.0",
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                          )
                                                        ],
                                                      ),
                                                    ))
                                              ],
                                            )),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
