import 'package:mylasttravelapp/Hotel/domain/entities/oneHotel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OneHotelModel extends OneHotel {
  OneHotelModel(
      {required super.activities,
      required super.etoiles,
      required super.images,
      required super.info,
      required super.placeName,
      required super.name,
      required super.note,
      required super.prix});

  factory OneHotelModel.fromJson(QueryDocumentSnapshot snapshot) {
    Map<String, dynamic> json = snapshot.data() as Map<String, dynamic>;
    return OneHotelModel(
        activities: json['activities'],
        etoiles: json['etoiles'],
        images: json['images'],
        info: json['information'],
        placeName: json['placename'],
        name: json['name'],
        note: json['note'],
        prix: json['prix']);
  }
}
