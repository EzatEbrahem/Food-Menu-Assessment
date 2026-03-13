import 'package:equatable/equatable.dart';

class FoodItemPreparationEntity extends Equatable{
  final String label;
  final String value;
  const FoodItemPreparationEntity({required this.label,required this.value,});
  @override
  List<Object?> get props => [label,value];

}