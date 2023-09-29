// ignore_for_file: must_be_immutable

import 'package:mylasttravelapp/admin/domain/entity/onHotel.dart';

class OneHotelModel1 extends OneHotel1 {
  Map<String, dynamic> toJson(OneHotelModel1 oneHotelModel1) {
    return {
      "name": oneHotelModel1.name,
      "activities": oneHotelModel1.activities,
      "etoiles": oneHotelModel1.etoiles,
      "images": oneHotelModel1.images,
      "information": oneHotelModel1.info,
      "placename": oneHotelModel1.placeName,
      "note": oneHotelModel1.note,
      "prix": oneHotelModel1.prix,
    };
  }
}
