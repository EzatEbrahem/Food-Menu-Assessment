import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:recast_designs_assessment/core/erorr/exception.dart';
import 'package:recast_designs_assessment/data/models/food_item_model.dart';

abstract class BaseFoodRemoteDataSource{

  Future <List<FoodItemModel>> getFoodMenuItems();
  Future <List<String>> getAtmosphereImages();

}
class FoodRemoteDataSource extends BaseFoodRemoteDataSource{
  @override
  Future<List<FoodItemModel>> getFoodMenuItems()async {
    try{
        final response=await rootBundle.loadString('assets/data/dummy_data.json');
        if(response.isEmpty) {
          throw LocalException(message: "No data founded");
        }
        final decodedData= jsonDecode(response);
        if(decodedData['food_menu']==null||(decodedData['food_menu']as List).isEmpty){
          throw LocalException(message: "Menu is empty now");
        }
        final foodItems=decodedData['food_menu'];
        return foodItems.map<FoodItemModel>((item)=>FoodItemModel.fromJson(item)).toList();
    }catch(exception){
      throw LocalException(message: 'Opps,Try again later');
    }
  }

  @override
  Future<List<String>> getAtmosphereImages()async {
    try{
      final response=await rootBundle.loadString('assets/data/dummy_data.json');
      if(response.isEmpty) {
        throw LocalException(message: "No data founded");
      }
      final decodedData= jsonDecode(response);
      if(decodedData['atmosphere_images']==null||(decodedData['atmosphere_images']as List).isEmpty){
        throw LocalException(message: "images not founded");
      }
      final List<String> atmosphereImages=(decodedData['atmosphere_images'] as List).cast<String>();
      return atmosphereImages;
    }catch(exception){
      throw LocalException(message: 'Opps,Try again later');
    }


  }

}