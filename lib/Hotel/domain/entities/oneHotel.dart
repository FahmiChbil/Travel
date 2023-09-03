import 'package:equatable/equatable.dart';

class OneHotel extends Equatable {
  final List<dynamic> activities;
  final String etoiles;
  final List<dynamic> images;
  final String info;
  final String name;
  final String note;
  final String prix;

  const OneHotel(
      {required this.activities,
      required this.etoiles,
      required this.images,
      required this.info,
      required this.name,
      required this.note,
      required this.prix});

  @override
  List<Object?> get props =>
      [activities, etoiles, images, info, name, note, prix];
}
