import 'package:dartz/dartz.dart';
import 'package:mylasttravelapp/Hotel/data/datasources/hotel_remote_datasource.dart';
import 'package:mylasttravelapp/Hotel/data/models/all_places.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/all_hotels.dart';

import 'package:mylasttravelapp/Hotel/domain/repositories/hotel_repository.dart';
import 'package:mylasttravelapp/core/Network/networ_info.dart';
import 'package:mylasttravelapp/core/errors/failure.dart';

class HotelRepositoryImpl extends HotelRepository {
  final NetworkInfo networkInfo;
  final HotelRemoteDataSourceImpl hotelRemoteDataSourceImpl;
  HotelRepositoryImpl(
      {required this.networkInfo, required this.hotelRemoteDataSourceImpl});
  @override
  Future<Either<Failure, AllHotels>> getHotels(String id) async {
    if (await networkInfo.isConnected) {
      final result = await hotelRemoteDataSourceImpl.getHotels(id);
      return right(result);
    }
    return left(ServerFailure());
  }

  @override
  Future<Either<Failure, AllPlacesModel>> getplaces() async {
    if (await networkInfo.isConnected) {
      final result = await hotelRemoteDataSourceImpl.getplaces();
      return right(result);
    }
    return left(ServerFailure());
  }
}
