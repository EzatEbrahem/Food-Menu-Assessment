import 'package:get_it/get_it.dart';
import 'package:recast_designs_assessment/data/dataSource/food_remote_data_source.dart';
import 'package:recast_designs_assessment/data/repository/food_repository.dart';
import 'package:recast_designs_assessment/domain/repository/base_food_repository.dart';
import 'package:recast_designs_assessment/domain/useCases/get_atmosphere_images_use_case.dart';
import 'package:recast_designs_assessment/domain/useCases/get_food_menu_items_use_case.dart';
import 'package:recast_designs_assessment/presentation/controller/food_bloc.dart';

final sl=GetIt.instance;
class ServicesLocator{
  void init(){
    sl.registerFactory(()=>FoodBloc(sl(),sl()));
    sl.registerLazySingleton(()=>GetAtmosphereImagesUseCase(sl()));
    sl.registerLazySingleton(()=>GetFoodMenuItemsUseCase(sl()));
    sl.registerLazySingleton<BaseFoodRepository>(()=>FoodRepository(sl()));
    sl.registerLazySingleton<BaseFoodRemoteDataSource>(()=>FoodRemoteDataSource());


  }
}