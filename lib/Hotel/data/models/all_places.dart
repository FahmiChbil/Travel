import 'package:mylasttravelapp/Hotel/data/models/PlaceModel.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/all_places.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AllPlacesModel extends AllPlaces {
  const AllPlacesModel({required super.places});
  factory AllPlacesModel.fromJson(
      List<QueryDocumentSnapshot<Object?>> datalist) {
    var list = datalist.map((e) => PlaceModel.fromJson(e)).toList();

    return AllPlacesModel(places: list);
  }
}
