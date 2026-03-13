import 'package:dartz/dartz.dart';
import 'package:recast_designs_assessment/core/erorr/exception.dart';
import 'package:recast_designs_assessment/core/erorr/failure.dart';
import 'package:recast_designs_assessment/data/dataSource/food_remote_data_source.dart';
import 'package:recast_designs_assessment/domain/entities/food_item_entity.dart';
import 'package:recast_designs_assessment/domain/repository/base_food_repository.dart';

class FoodRepository extends BaseFoodRepository{
  final BaseFoodRemoteDataSource baseFoodItemRemoteDataSource;

  FoodRepository(this.baseFoodItemRemoteDataSource);

  @override
  Future<Either<Failure, List<String>>> getAtmosphereImages()async {
    try{
      final listOfAtmosphereImages=await baseFoodItemRemoteDataSource.getAtmosphereImages();
      return Right(listOfAtmosphereImages);
    }on LocalException catch(exception){
      return Left(LocalFailure(exception.message));
    }

  }

  @override
  Future<Either<Failure, List<FoodItemEntity>>> getFoodItems()async {
    try{
      final listOfFoodItems=await baseFoodItemRemoteDataSource.getFoodMenuItems();
      return Right(listOfFoodItems.map((item)=>item.toEntity()).toList());
    }on LocalException catch(exception){
      return Left(LocalFailure(exception.message));
    }
  }

}