import 'package:recast_designs_assessment/domain/entities/food_item_preparation_entity.dart';

class FoodItemPreparationModel extends FoodItemPreparationEntity{


  const FoodItemPreparationModel({required super.label, required super.value});

  factory FoodItemPreparationModel.fromJson(Map<String , dynamic> json){
    return FoodItemPreparationModel(label: json['label']??'', value: json['value'].toString()??'');
  }

  factory FoodItemPreparationModel.fromEntity(FoodItemPreparationEntity foodItemPreparationEntity)=>
     FoodItemPreparationModel(label: foodItemPreparationEntity.label, value: foodItemPreparationEntity.value);
  FoodItemPreparationEntity toEntity()=>
      FoodItemPreparationEntity(label: label, value: value);
}