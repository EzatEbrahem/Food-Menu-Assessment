import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recast_designs_assessment/domain/entities/food_item_entity.dart';
import 'package:recast_designs_assessment/presentation/widgets/glass_badge_widget.dart';

import '../../core/utils/app_constant.dart';

class FoodItemCardComponent extends StatelessWidget {
  final FoodItemEntity item;
  const FoodItemCardComponent({super.key,
  required this.item,
});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(9.r),
      child: Stack(
        alignment: Alignment.bottomCenter,
        fit: StackFit.passthrough,
        children: [
          Hero(
            tag: 'item-image-${item.id}',
            child: Image.asset(
              item.image,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: -8,
            left: -8,
            right: -8,
            child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 3.w,sigmaY: 3.w),
              child: ShaderMask(
                shaderCallback: (rect){
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Colors.black.withOpacity(0)
                    ],
                    stops: const[
                      0.71,0.5
                    ]).createShader(rect);

                },
                blendMode: BlendMode.dstOut,
                child: Image.asset(
                  item.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          if(item.isTrending)...[
            Positioned(
              top: 5.h,
              left: 4.w,
              child: buildGlassBadgeWidget(content: "Trending", contentSize: 7,
                  contentWidth: 26, contentHeight: 7, widthBadge: 39,
                  heightBadge: 16, radiusBadge: 12,badgeBoxShape: BoxShape.rectangle) ,
            )
          ],
          Positioned(
            bottom: 4.h,
            left: 7.w,
            right: 4.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(item.name, style: TextStyle(
                      fontFamily: AppConstant.appFontFamily,
                      fontWeight: FontWeight.w500,
                      height: 0.98,
                      letterSpacing: 8 * -0.05,
                      leadingDistribution: TextLeadingDistribution.even,
                      color: Colors.white,fontSize:8.sp, ),
                    maxLines: 2,
                    overflow: TextOverflow.clip,),
                ),
                buildGlassBadgeWidget(content: "${item.price}\nJOD", contentSize: 6,
                    contentWidth: 16, contentHeight: 11, widthBadge: 27,
                    heightBadge: 27, radiusBadge: 13.5,badgeBoxShape: BoxShape.circle)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
