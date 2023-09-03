import 'package:dartz/dartz.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/all_hotels.dart';

import 'package:mylasttravelapp/Hotel/domain/repositories/hotel_repository.dart';
import 'package:mylasttravelapp/core/errors/failure.dart';

class GetAllHotelsUseCase {
  final HotelRepository hotelRepository;
  GetAllHotelsUseCase(this.hotelRepository);
  Future<Either<Failure, AllHotels>> call(String docid) async {
    return await hotelRepository.getHotels(docid);
  }
}
