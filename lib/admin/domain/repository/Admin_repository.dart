// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/one_hotel.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/place.dart';
import 'package:mylasttravelapp/core/errors/failure.dart';

abstract class AdminRepository {
  Future<Either<Failure, Unit>> addData(
      OneHotel oneHotelModel, Place placeModel);
}
