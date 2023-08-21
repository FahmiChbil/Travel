import 'package:dartz/dartz.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/place.dart';
import 'package:mylasttravelapp/core/errors/failure.dart';

abstract class HotelRepository {
  Future<Either<Failure, List<Place>>> getPlaces();
}
