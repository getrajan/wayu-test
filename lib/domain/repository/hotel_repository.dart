import 'package:wayu_test/data/model/hotel.dart';

abstract class HotelRepository {
  Future<List<Hotel>> getCategoryHotels();
}
