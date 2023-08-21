import 'package:equatable/equatable.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/place.dart';

class Hotels extends Equatable {
  List<Place> places;
  Hotels(this.places);

  @override
  List<Object?> get props => [this.places];
}
