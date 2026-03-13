import 'package:equatable/equatable.dart';
import 'package:recast_designs_assessment/core/utils/enums.dart';
import 'package:recast_designs_assessment/domain/entities/food_item_entity.dart';

class FoodState extends Equatable{
  final LoadFoodMenuItemsState loadFoodMenuItemsState;
  final String loadFoodMenuItemsErrorMessage;
  final LoadAtmosphereImagesState loadAtmosphereImagesState;
  final String loadAtmosphereImagesErrorMessage;
  final List<FoodItemEntity> listOfFoodMenu;
  final List<String> listOfAtmosphereImages;

  const FoodState({
    this.loadFoodMenuItemsState=LoadFoodMenuItemsState.initial,
    this.loadFoodMenuItemsErrorMessage='',
    this.loadAtmosphereImagesState=LoadAtmosphereImagesState.initial,
    this.loadAtmosphereImagesErrorMessage='',
    this.listOfFoodMenu=const[],
    this.listOfAtmosphereImages=const[]
  });
  FoodState copyWith({
     LoadFoodMenuItemsState? loadFoodMenuItemsState,
     String? loadFoodMenuItemsErrorMessage,
     LoadAtmosphereImagesState? loadAtmosphereImagesState,
     String? loadAtmosphereImagesErrorMessage,
     List<FoodItemEntity>? listOfFoodMenu,
     List<String>? listOfAtmosphereImages,

  }){
    return FoodState(
      listOfAtmosphereImages: listOfAtmosphereImages??this.listOfAtmosphereImages,
      loadAtmosphereImagesState:loadAtmosphereImagesState??this.loadAtmosphereImagesState,
      listOfFoodMenu: listOfFoodMenu??this.listOfFoodMenu,
      loadFoodMenuItemsState:loadFoodMenuItemsState??this.loadFoodMenuItemsState ,
      loadAtmosphereImagesErrorMessage:loadAtmosphereImagesErrorMessage??this.loadAtmosphereImagesErrorMessage ,
      loadFoodMenuItemsErrorMessage: loadFoodMenuItemsErrorMessage??this.loadFoodMenuItemsErrorMessage
    );
  }

  @override
  List<Object?> get props => [listOfAtmosphereImages,loadAtmosphereImagesState,
    listOfFoodMenu,loadFoodMenuItemsState,loadAtmosphereImagesErrorMessage,loadFoodMenuItemsErrorMessage];

}