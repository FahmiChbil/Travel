// import 'package:equatable/equatable.dart';
// import 'package:mylasttravelapp/Hotel/domain/entities/hotel2.dart';
// import 'package:mylasttravelapp/Hotel/domain/entities/hotels.dart';

// class AllHotels extends Equatable {
//  final  List<Hotels>? hotels;

//   const AllHotels({required this.hotels});
//   @override
//   List<Object?> get props => [hotels];
// }

import 'package:equatable/equatable.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/place.dart';

class AllPlaces extends Equatable {
  final List<Place> places;

  const AllPlaces({required this.places});
  @override
  List<Object?> get props => [places];
}
