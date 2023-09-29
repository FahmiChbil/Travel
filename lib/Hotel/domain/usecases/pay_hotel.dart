import 'package:dartz/dartz.dart';
import 'package:mylasttravelapp/Hotel/domain/repositories/hotel_repository.dart';
import 'package:mylasttravelapp/core/errors/failure.dart';

class PayHotelUseCase {
  HotelRepository hotelRepository;
  PayHotelUseCase(this.hotelRepository);
  Future<Either<Failure, Unit>> call(int amount, String type) async {
    return await hotelRepository.payHotel(amount, type);
  }
}
