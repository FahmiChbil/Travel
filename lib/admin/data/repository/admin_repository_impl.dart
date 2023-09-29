import 'package:dartz/dartz.dart';
import 'package:mylasttravelapp/Hotel/data/models/PlaceModel.dart';
import 'package:mylasttravelapp/Hotel/data/models/one_hotel.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/one_hotel.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/place.dart';
import 'package:mylasttravelapp/admin/data/datasources/admin_remote_datasources.dart';
import 'package:mylasttravelapp/admin/domain/repository/Admin_repository.dart';
import 'package:mylasttravelapp/core/Exceptions/exception.dart';
import 'package:mylasttravelapp/core/Network/networ_info.dart';
import 'package:mylasttravelapp/core/errors/failure.dart';

class AdminRepositoryImpl implements AdminRepository {
  NetworkInfo networkInfo;
  AdminRemoteDataSourcImpl adminRemoteDataSourcImpl;
  AdminRepositoryImpl(
      {required this.networkInfo, required this.adminRemoteDataSourcImpl});

  @override
  Future<Either<Failure, Unit>> addData(OneHotel oneHotel, Place place) async {
    OneHotelModel oneHotelModel = OneHotelModel(
        activities: oneHotel.activities,
        etoiles: oneHotel.etoiles,
        images: oneHotel.images,
        info: oneHotel.info,
        placeName: oneHotel.placeName,
        name: oneHotel.name,
        note: oneHotel.note,
        prix: oneHotel.prix);

    PlaceModel placeModel =
        PlaceModel(name: place.name, background: place.background);
    if (await networkInfo.isConnected) {
      try {
        var result =
            await adminRemoteDataSourcImpl.addData(oneHotelModel, placeModel);
        return right(result);
      } on ServerException {
        return left(ServerFailure());
      }
    }
    return left(OfflinFailure());
  }
}
