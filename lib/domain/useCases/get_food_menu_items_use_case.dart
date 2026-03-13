import 'package:dartz/dartz.dart';
import 'package:recast_designs_assessment/core/erorr/failure.dart';
import 'package:recast_designs_assessment/core/usecase/base_use_case.dart';
import 'package:recast_designs_assessment/domain/entities/food_item_entity.dart';
import 'package:recast_designs_assessment/domain/repository/base_food_repository.dart';

class GetFoodMenuItemsUseCase extends BaseUseCase<List<FoodItemEntity>>{
  final BaseFoodRepository baseFoodRepository;
  GetFoodMenuItemsUseCase(this.baseFoodRepository);
  @override
  Future<Either<Failure, List<FoodItemEntity>>> call() {
    return baseFoodRepository.getFoodItems();
  }

}