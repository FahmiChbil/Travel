import 'package:dartz/dartz.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/one_hotel.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/place.dart';
import 'package:mylasttravelapp/admin/domain/repository/Admin_repository.dart';
import 'package:mylasttravelapp/core/errors/failure.dart';

class AddDataUseCase {
  AdminRepository adminRepository;
  AddDataUseCase(this.adminRepository);

  Future<Either<Failure, Unit>> call(
      OneHotel oneHotelModel, Place placeModel) async {
    return adminRepository.addData(oneHotelModel, placeModel);
  }
}
