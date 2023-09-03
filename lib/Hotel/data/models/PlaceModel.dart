import 'package:mylasttravelapp/Hotel/domain/entities/place.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/place.dart';

class PlaceModel extends Place {
  PlaceModel({required super.name, required super.background});

  factory PlaceModel.fromJson(QueryDocumentSnapshot<Object?> snapshot) {
    var jsonData = snapshot.data() as Map<String, dynamic>;
    return PlaceModel(
        name: jsonData['name'], background: jsonData['background']);
  }
}
