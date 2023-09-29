// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/one_hotel.dart';

class AllHotels extends Equatable {
  List<OneHotel> allhotels;

  AllHotels({required this.allhotels});

  @override
  List<Object?> get props => [allhotels];
}
