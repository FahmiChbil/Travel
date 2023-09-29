import 'package:dartz/dartz.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/all_hotels.dart';

import 'package:mylasttravelapp/Hotel/domain/entities/all_places.dart';

import 'package:mylasttravelapp/core/errors/failure.dart';

abstract class HotelRepository {
  Future<Either<Failure, AllHotels>> getHotels(String docid);
  Future<Either<Failure, AllPlaces>> getplaces();
  Future<Either<Failure, Unit>> payHotel(int amount, String type);
}
