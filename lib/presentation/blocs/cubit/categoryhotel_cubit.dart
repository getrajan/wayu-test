import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wayu_test/data/model/hotel.dart';
import 'package:wayu_test/domain/usecase/get_category_hotel_usecase.dart';

part 'categoryhotel_state.dart';

class CategoryhotelCubit extends Cubit<CategoryhotelState> {
  CategoryhotelCubit(this.getCategoryHotelUseCase)
      : super(CategoryhotelInitial());

  final GetCategoryHotelUseCase getCategoryHotelUseCase;

  void loadCategoryHotels() async {
    final List<Hotel> hotels = await getCategoryHotelUseCase.getCategoryHotel();
    if (hotels.isNotEmpty) {
      emit(CategoryLoadedState(hotels));
    } else {
      emit(CategoryLoadFailedState("No Hotels Detail"));
    }
  }
}
