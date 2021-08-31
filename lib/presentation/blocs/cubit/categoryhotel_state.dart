part of 'categoryhotel_cubit.dart';

@immutable
abstract class CategoryhotelState {}

class CategoryhotelInitial extends CategoryhotelState {}

class CategoryLoadedState extends CategoryhotelState {
  final List<Hotel> hotels;

  CategoryLoadedState(this.hotels);
}

class CategoryLoadFailedState extends CategoryhotelState {
  final String error;

  CategoryLoadFailedState(this.error);
}
