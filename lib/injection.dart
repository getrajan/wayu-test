import 'package:get_it/get_it.dart';
import 'package:wayu_test/data/respository/i_hotel_repository.dart';
import 'package:wayu_test/data/source/hotel_source.dart';
import 'package:wayu_test/domain/repository/hotel_repository.dart';
import 'package:wayu_test/domain/usecase/get_category_hotel_usecase.dart';
import 'package:wayu_test/presentation/blocs/cubit/categoryhotel_cubit.dart';

final sl = GetIt.instance;

void init() {
//  blocs register
  sl.registerLazySingleton(() => CategoryhotelCubit(sl()));

// use case
  sl.registerLazySingleton(() => GetCategoryHotelUseCase(sl()));
// repository
  sl.registerLazySingleton<HotelRepository>(() => IHotelRepository(sl()));

// Data source
  sl.registerLazySingleton<HotelDataSource>(() => IHotelDataSource());
}
