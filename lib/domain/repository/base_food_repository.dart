import 'package:dartz/dartz.dart';
import 'package:recast_designs_assessment/core/erorr/failure.dart';
import 'package:recast_designs_assessment/domain/entities/food_item_entity.dart';

abstract class BaseFoodRepository{
  Future<Either<Failure,List<FoodItemEntity>>> getFoodItems();
  Future<Either<Failure,List<String>>> getAtmosphereImages();
}