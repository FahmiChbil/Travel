// ignore_for_file: file_names

import 'package:mylasttravelapp/Hotel/domain/entities/place.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlaceModel extends Place {
  const PlaceModel({required super.name, required super.background});

  factory PlaceModel.fromJson(QueryDocumentSnapshot<Object?> snapshot) {
    var jsonData = snapshot.data() as Map<String, dynamic>;
    return PlaceModel(
        name: jsonData['name'], background: jsonData['background']);
  }

  Map<String, dynamic> toJson() {
    return {"background": background, "name": name};
  }
}
