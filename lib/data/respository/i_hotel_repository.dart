import 'package:wayu_test/data/model/hotel.dart';
import 'package:wayu_test/data/source/hotel_source.dart';
import 'package:wayu_test/domain/repository/hotel_repository.dart';

class IHotelRepository extends HotelRepository {
  final HotelDataSource hotelDataSource;

  IHotelRepository(this.hotelDataSource);
  @override
  Future<List<Hotel>> getCategoryHotels() async {
    return hotelDataSource.getCategoryHotels();
  }
}
