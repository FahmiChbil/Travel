import 'package:equatable/equatable.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/oneHotel.dart';

class RecommendedHotel extends Equatable {
  final List<OneHotel> recomendedHotels;

  RecommendedHotel(this.recomendedHotels);

  @override
  List<Object?> get props => [this.recomendedHotels];
}
