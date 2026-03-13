import 'package:dartz/dartz.dart';
import 'package:recast_designs_assessment/core/erorr/failure.dart';

abstract class BaseUseCase<T>{
  Future<Either<Failure,T>> call();
}