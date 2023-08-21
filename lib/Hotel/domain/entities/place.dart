import 'package:equatable/equatable.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/recomended_hotel.dart';

class Place extends Equatable {
  RecommendedHotel recommendedHotel;

  Place(this.recommendedHotel);
  @override
  List<Object?> get props => [this.recommendedHotel];
}
