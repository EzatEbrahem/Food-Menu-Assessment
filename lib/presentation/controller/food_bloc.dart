import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recast_designs_assessment/core/utils/enums.dart';
import 'package:recast_designs_assessment/domain/useCases/get_atmosphere_images_use_case.dart';
import 'package:recast_designs_assessment/domain/useCases/get_food_menu_items_use_case.dart';
import 'package:recast_designs_assessment/presentation/controller/food_events.dart';
import 'package:recast_designs_assessment/presentation/controller/food_states.dart';

class FoodBloc extends Bloc<FoodEvent,FoodState>{
  final GetFoodMenuItemsUseCase getFoodMenuItemsUseCase;
  final GetAtmosphereImagesUseCase getAtmosphereImagesUseCase;
  FoodBloc(this.getFoodMenuItemsUseCase, this.getAtmosphereImagesUseCase)
      :super(const FoodState()){
    on<GetFoodMenuItemsEvent>((event,emit)async{
       emit(state.copyWith(loadFoodMenuItemsErrorMessage: '',
           loadFoodMenuItemsState: LoadFoodMenuItemsState.loading,listOfFoodMenu: []));
       final result =await getFoodMenuItemsUseCase();
       result.fold(
               (ifError)=>emit(state.copyWith(
                   listOfFoodMenu: [],
                   loadFoodMenuItemsState: LoadFoodMenuItemsState.error,
                   loadFoodMenuItemsErrorMessage:ifError.message)),
               (ifSucceed)=>emit(state.copyWith(
                   listOfFoodMenu: ifSucceed,
                   loadFoodMenuItemsState: LoadFoodMenuItemsState.loaded,
                   loadFoodMenuItemsErrorMessage:'')));
    });

    on<GetAtmosphereImagesEvent>((event,emit)async{
      emit(state.copyWith(loadAtmosphereImagesErrorMessage: '',
          loadAtmosphereImagesState: LoadAtmosphereImagesState.loading,listOfAtmosphereImages: []));
      final result =await getAtmosphereImagesUseCase();
      result.fold(
              (ifError)=>emit(state.copyWith(
              listOfAtmosphereImages: [],
                  loadAtmosphereImagesState: LoadAtmosphereImagesState.error,
                  loadAtmosphereImagesErrorMessage:ifError.message)),
              (ifSucceed)=>emit(state.copyWith(
                  listOfAtmosphereImages: ifSucceed,
                  loadAtmosphereImagesState: LoadAtmosphereImagesState.loaded,
                  loadAtmosphereImagesErrorMessage:'')));
    });
  }

}