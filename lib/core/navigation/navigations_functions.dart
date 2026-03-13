import 'package:flutter/cupertino.dart';

import '../../domain/entities/food_item_entity.dart';
import '../../presentation/screens/food_item_details_screen.dart';

void navigateToItemDetails(BuildContext context, FoodItemEntity item) {
  Navigator.push(
    context,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) =>
          FoodItemDetailsComponent(item: item),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
  );
}