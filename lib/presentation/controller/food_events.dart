import 'package:equatable/equatable.dart';

abstract class FoodEvent extends Equatable{}
class GetAtmosphereImagesEvent extends FoodEvent{
  @override
  List<Object?> get props => [];

}
class GetFoodMenuItemsEvent extends FoodEvent{
  @override
  List<Object?> get props => [];
}