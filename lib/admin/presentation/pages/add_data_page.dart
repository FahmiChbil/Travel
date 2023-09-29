// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:mylasttravelapp/Hotel/domain/entities/one_hotel.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/place.dart';

import 'package:mylasttravelapp/admin/presentation/cubit/edit_data_cubit.dart';
import 'package:mylasttravelapp/admin/presentation/widget/custom_textform_field.dart';
import 'package:mylasttravelapp/core/const/themes.dart';

class AddDataPage extends StatelessWidget {
  AddDataPage({super.key});
  static const String id = "route";
  final GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController placeControoler = TextEditingController();
  TextEditingController backgroundImageController = TextEditingController();
  TextEditingController hotelNameController = TextEditingController();
  TextEditingController infoControoler = TextEditingController();
  TextEditingController imageControoler = TextEditingController();
  TextEditingController etoileControoler = TextEditingController();
  TextEditingController prixControoler = TextEditingController();
  TextEditingController noteControoler = TextEditingController();
  TextEditingController activitiesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditDataCubit, EditDataState>(
      listener: (context, state) {
        if (state is AddedDataSucces) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.succedmsg),
            backgroundColor: Colors.green.shade300,
          ));
        } else if (state is AddedDataFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errormsg),
            backgroundColor: Colors.red.shade400,
          ));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Add data"),
          backgroundColor: HexColor("018a78"),
          elevation: 0,
        ),
        body: Form(
          key: _formkey,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                        myContoller: placeControoler,
                        myHint: "place",
                        myLabel: " place ",
                        formatters: const [],
                        myValidator: (value) {
                          if (value!.isEmpty) {
                            return "Enter valid place name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        myContoller: backgroundImageController,
                        myValidator: (value) {
                          if (value == null ||
                              kimageFormat.hasMatch(value) == false) {
                            return "enter valid image file";
                          }
                          return null;
                        },
                        myHint: "background  image",
                        myLabel: " background",
                        formatters: const [],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        myContoller: hotelNameController,
                        myHint: "hotel name",
                        myLabel: " hotel name ",
                        formatters: const [],
                        myValidator: (value) {
                          if (value!.isEmpty) {
                            return "Enter valid place name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        myContoller: infoControoler,
                        myHint: "hotel information",
                        myLabel: " info ",
                        formatters: const [],
                        myValidator: (value) {
                          if (value!.isEmpty) {
                            return "Enter valid place name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        myContoller: imageControoler,
                        myValidator: (value) {
                          if (value == null ||
                              kimageFormat.hasMatch(value) == false) {
                            return "enter valid image file";
                          }
                          return null;
                        },
                        myHint: "hote image",
                        myLabel: " image",
                        formatters: const [],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        myContoller: etoileControoler,
                        myHint: "etoiles",
                        myLabel: " etoiles",
                        formatters: const [
                          // FilteringTextInputFormatter.allow(
                          //     RegExp(r'\b\w+\.(jpg|jpeg)\b'))
                          // FilteringTextInputFormatter.allow(filterPattern)
                        ],
                        myValidator: (value) {
                          if (value!.isEmpty) {
                            return "Enter valid text";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        myContoller: prixControoler,
                        myHint: "prix",
                        myLabel: " prix ",
                        formatters: const [
                          // FilteringTextInputFormatter.allow(
                          //     RegExp(r'\b\w+\.(jpg|jpeg)\b'))
                          // FilteringTextInputFormatter.allow(filterPattern)
                        ],
                        myValidator: (value) {
                          if (value!.isEmpty) {
                            return "Enter valid text";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        myContoller: noteControoler,
                        myHint: "note",
                        myLabel: " note ",
                        formatters: const [
                          // FilteringTextInputFormatter.allow(
                          //     RegExp(r'\b\w+\.(jpg|jpeg)\b'))
                          // FilteringTextInputFormatter.allow(filterPattern)
                        ],
                        myValidator: (value) {
                          if (value!.isEmpty) {
                            return "Enter valid note";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        myContoller: activitiesController,
                        myHint: "activities",
                        myLabel: " activities",
                        formatters: const [
                          // FilteringTextInputFormatter.allow(
                          //     RegExp(r'\b\w+\.(jpg|jpeg)\b'))
                          // FilteringTextInputFormatter.allow(filterPattern)
                        ],
                        myValidator: (value) {
                          if (value!.isEmpty) {
                            return "Enter valid note";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              // AdminRemoteDataSourcImpl().addData(
                              //     OneHotelModel(
                              //         activities: [activitiesController.text],
                              //         etoiles: etoileControoler.text,
                              //         images: [imageControoler.text],
                              //         info: infoControoler.text,
                              //         placeName: placeControoler.text,
                              //         name: hotelNameController.text,
                              //         note: noteControoler.text,
                              //         prix: prixControoler.text),
                              //     PlaceModel(
                              //         name: placeControoler.text,
                              //         background:
                              //             backgroundImageController.text));

                              context.read<EditDataCubit>().addData(
                                  OneHotel(
                                      activities: [activitiesController.text],
                                      etoiles: etoileControoler.text,
                                      images: [imageControoler.text],
                                      info: infoControoler.text,
                                      placeName: placeControoler.text,
                                      name: hotelNameController.text,
                                      note: noteControoler.text,
                                      prix: prixControoler.text),
                                  Place(
                                    name: placeControoler.text,
                                    background: backgroundImageController.text,
                                  ));
                            }
                          },
                          child: const Text("valdi")),
                      SizedBox(
                        height: 20.h,
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
