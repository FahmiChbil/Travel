import 'package:dartz/dartz.dart';
import 'package:mylasttravelapp/Hotel/data/models/all_hotels_model.dart';
import 'package:mylasttravelapp/Hotel/data/models/hotels_Model.dart';
import 'package:mylasttravelapp/Hotel/data/models/person.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/hotels.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HotelRemoteDataSource {
  Future<List<QueryDocumentSnapshot>> getHotels();
}

class HotelRemoteDataSourceImpl implements HotelRemoteDataSource {
  @override
  Future<List<QueryDocumentSnapshot>> getHotels() async {
    CollectionReference userRef =
        FirebaseFirestore.instance.collection('S6BUWTzLfMUk5M4NOdM8U4iW8G82');

    QuerySnapshot querySnapshot = await userRef.get();
    List<QueryDocumentSnapshot> listdocs = querySnapshot.docs;

    // AllHotelsModels hotels = AllHotelsModels.fromJson(listdocs);
    print(listdocs.first.data());

    return listdocs;
  }
}
