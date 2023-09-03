import 'package:dartz/dartz.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/all_places.dart';
import 'package:mylasttravelapp/Hotel/domain/repositories/hotel_repository.dart';
import 'package:mylasttravelapp/core/errors/failure.dart';

class GetAllPlacesUseCase {
  final HotelRepository hotelRepository;
  GetAllPlacesUseCase(this.hotelRepository);

  Future<Either<Failure, AllPlaces>> call() async {
    return await hotelRepository.getplaces();
  }
}
