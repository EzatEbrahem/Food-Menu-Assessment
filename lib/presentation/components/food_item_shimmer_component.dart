import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class FoodItemShimmerComponent extends StatelessWidget {
  const FoodItemShimmerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor:Colors.grey[900]!,
      highlightColor: Colors.grey[800]!,
      child: Container(
        height: 120.h,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(9.r)
        ),
      ),
    );
  }
}
