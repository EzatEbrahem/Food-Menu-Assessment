import 'package:dartz/dartz.dart';
import 'package:recast_designs_assessment/core/erorr/failure.dart';
import 'package:recast_designs_assessment/core/usecase/base_use_case.dart';
import 'package:recast_designs_assessment/domain/repository/base_food_repository.dart';

class GetAtmosphereImagesUseCase extends BaseUseCase<List<String>>{
  final BaseFoodRepository baseFoodRepository;
  GetAtmosphereImagesUseCase(this.baseFoodRepository);

  @override
  Future<Either<Failure, List<String>>> call() {
    return baseFoodRepository.getAtmosphereImages();
  }

}