import 'package:wayu_test/data/model/hotel.dart';
import 'package:wayu_test/domain/repository/hotel_repository.dart';

class GetCategoryHotelUseCase {
  final HotelRepository hotelRepository;

  GetCategoryHotelUseCase(this.hotelRepository);

  Future<List<Hotel>> getCategoryHotel() async {
    return hotelRepository.getCategoryHotels();
  }
}
