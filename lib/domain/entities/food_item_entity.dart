import 'package:equatable/equatable.dart';
import 'package:recast_designs_assessment/domain/entities/food_item_preparation_entity.dart';

class FoodItemEntity extends Equatable{
  final String id;
  final String name;
  final String image;
  final String description;
  final String type;
  final double price;
  final bool isTrending;
  final List<FoodItemPreparationEntity> preparation;
  const FoodItemEntity({required this.id,required this.name,required this.image,
    required this.description,required this.type,
    required this.price,required this.isTrending,required this.preparation});

  @override
  List<Object?> get props => [id,name,image,price,description,preparation,isTrending,type];

}