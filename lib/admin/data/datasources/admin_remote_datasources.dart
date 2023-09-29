import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mylasttravelapp/Hotel/data/models/PlaceModel.dart';
import 'package:mylasttravelapp/Hotel/data/models/one_hotel.dart';

abstract class AdminRemoteDataSource {
  Future<Unit> addData(OneHotelModel oneHotelModel, PlaceModel placeModel);
}

class AdminRemoteDataSourcImpl implements AdminRemoteDataSource {
  @override
  Future<Unit> addData(
      OneHotelModel oneHotelModel, PlaceModel placeModel) async {
    var firestore = FirebaseFirestore.instance;

    DocumentReference documentReference = firestore.collection("hotels2").doc();

    await firestore
        .collection("hotels2")
        .doc(documentReference.id)
        .collection("hotels")
        .doc()
        .set(oneHotelModel.toJson());

    await firestore
        .collection("hotels2")
        .doc(documentReference.id)
        .set(placeModel.toJson());

    return Future.value(unit);
  }
}
