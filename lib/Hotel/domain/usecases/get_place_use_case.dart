import 'package:dartz/dartz.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/place.dart';
import 'package:mylasttravelapp/Hotel/domain/repositories/hotel_repository.dart';
import 'package:mylasttravelapp/core/errors/failure.dart';

class GetPlacesUseCase {
  final HotelRepository hotelRepository;
  GetPlacesUseCase(this.hotelRepository);
  Future<Either<Failure, List<Place>>> call() async {
    return await hotelRepository.getPlaces();
  }
}
