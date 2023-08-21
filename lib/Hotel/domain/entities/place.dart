import 'package:equatable/equatable.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/recomended_hotel.dart';

class Place extends Equatable {
  final RecommendedHotel recommendedHotel;
  final String backgroundImage;

  Place(this.recommendedHotel, this.backgroundImage);
  @override
  List<Object?> get props => [this.recommendedHotel, this.backgroundImage];
}
