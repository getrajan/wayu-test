import 'package:wayu_test/data/model/hotel.dart';

abstract class HotelDataSource {
  Future<List<Hotel>> getCategoryHotels();
}

class IHotelDataSource implements HotelDataSource {
  @override
  Future<List<Hotel>> getCategoryHotels() async {
    /**
     * Get Category hotels from source
     */
    try {
      final List<Hotel> hotels = categoryHotels;
      return hotels;
    } catch (e) {
      throw Exception(e);
    }
  }
}
