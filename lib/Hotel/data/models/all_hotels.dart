import 'package:mylasttravelapp/Hotel/data/models/one_hotel.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/all_hotels.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AllHotelsModel extends AllHotels {
  AllHotelsModel({required super.allhotels});

  factory AllHotelsModel.fromJson(List<QueryDocumentSnapshot> dataList) {
    List<OneHotelModel> jsondata =
        dataList.map((e) => OneHotelModel.fromJson(e)).toList();

    return AllHotelsModel(allhotels: jsondata);
  }
}
