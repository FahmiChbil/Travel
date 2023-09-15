import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mylasttravelapp/Hotel/data/models/all_hotels.dart';
import 'package:mylasttravelapp/Hotel/data/models/all_places.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/all_hotels.dart';

abstract class HotelRemoteDataSource {
  Future<AllHotels> getHotels(String docid);
  Future<AllPlacesModel> getplaces();
}

class HotelRemoteDataSourceImpl implements HotelRemoteDataSource {
  Future<List<String>> getdocsId() async {
    var collection = FirebaseFirestore.instance.collection('hotels2');

    var querySnapshot = await collection.get();
    var ids = querySnapshot.docs.map((e) => e.id).toList();
    print(ids);
    return ids;
  }

  @override
  Future<AllHotels> getHotels(String docId) async {
    CollectionReference userRef = FirebaseFirestore.instance
        .collection('hotels2')
        .doc(docId)
        .collection('hotels');
    QuerySnapshot data = await userRef.get();
    List<QueryDocumentSnapshot> dataList = data.docs;
    var hotels = AllHotelsModel.fromJson(dataList);
    print("=================");

    print(hotels.allhotels.first.activities);
    return hotels;
  }

  @override
  Future<AllPlacesModel> getplaces() async {
    CollectionReference userRef =
        FirebaseFirestore.instance.collection('hotels2');
    QuerySnapshot data = await userRef.get();
    List<QueryDocumentSnapshot> dataList = data.docs;
    var places = AllPlacesModel.fromJson(dataList);
    // print("============");
    // print(hotels);

    return Future.value(places);
  }
}
