import 'package:equatable/equatable.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/oneHotel.dart';

class AllHotels extends Equatable {
  List<OneHotel> allhotels;

  AllHotels({required this.allhotels});

  @override
  List<Object?> get props => [allhotels];
}
