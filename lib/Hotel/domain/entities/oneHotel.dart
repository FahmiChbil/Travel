import 'package:equatable/equatable.dart';

class OneHotel extends Equatable {
  final List<String?> activities;
  final List<String?> images;
  final String? etoiles;
  final String information;
  final String name;
  final String note;
  final int prixNuit;

  const OneHotel(this.activities, this.images, this.etoiles, this.information,
      this.name, this.note, this.prixNuit);

  @override
  List<Object?> get props =>
      [activities, images, etoiles, information, name, note, prixNuit];
}
