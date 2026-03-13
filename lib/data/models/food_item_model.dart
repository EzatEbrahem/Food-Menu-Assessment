import 'package:recast_designs_assessment/data/models/food_item_preparation_model.dart';
import 'package:recast_designs_assessment/domain/entities/food_item_entity.dart';

class FoodItemModel extends FoodItemEntity{
  const FoodItemModel({
    required super.id, required super.name,
    required super.image, required super.description,
    required super.type, required super.price, required super.isTrending,
    required super.preparation});

  factory FoodItemModel.fromJson(Map<String,dynamic> json){
    return FoodItemModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        description: json['description'],
        type: json['type'],
        price: json['price'].toDouble(),
        isTrending: json['isTrending'],
        preparation: (json['preparation']as List).map((preparation)=>FoodItemPreparationModel.fromJson(preparation)).toList());


  }
  factory FoodItemModel.fromEntity(FoodItemEntity foodItemEntity)=>
      FoodItemModel(id: foodItemEntity.id, name: foodItemEntity.name,
          image: foodItemEntity.image, description: foodItemEntity.description,
          type: foodItemEntity.type, price: foodItemEntity.price,
          isTrending: foodItemEntity.isTrending,preparation: foodItemEntity.preparation);

  FoodItemEntity toEntity()=>FoodItemEntity(id: id, name: name,
      image: image, description: description, type: type,
      price: price, isTrending: isTrending, preparation: preparation);
}