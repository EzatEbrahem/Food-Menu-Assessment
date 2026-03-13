import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recast_designs_assessment/core/utils/app_constant.dart';
import 'package:recast_designs_assessment/domain/entities/food_item_entity.dart';
import 'package:recast_designs_assessment/presentation/components/item_description_component.dart';
import 'package:recast_designs_assessment/presentation/components/preparations_badge_component.dart';

import '../widgets/arrow_back_widget.dart';

class FoodItemDetailsComponent extends StatelessWidget {
  final FoodItemEntity item;
  const FoodItemDetailsComponent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackGroundColor,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            expandedHeight: 325.0,
            pinned: false,
            stretch: true,
            backgroundColor: AppColors.appBackGroundColor,
            leading: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: buildArrowBackWidget()),
            leadingWidth: 48.w,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: 'item-image-${item.id}',
                    child: Image.asset(
                      item.image,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            AppColors.appBackGroundColor.withOpacity(0.1),
                            AppColors.appBackGroundColor,
                          ],
                          stops: const [0.0, 0.6, 1.0],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.w ),
                  child:
                  SizedBox(
                    width: 54.w,
                    height: 14.h,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        item.type,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: AppConstant.appFontFamily,
                          fontWeight: FontWeight.w700,
                          fontSize: 10.sp,
                          height: 1,
                          letterSpacing: 10 * -0.05,
                          color: Color.fromRGBO(255, 255, 255, 0.6),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 15.w,top: 1.h),
                  child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(228, 182, 121, 1),
                        Color.fromRGBO(254, 229, 196, 1),
                      ],
                      stops: [0.0025, 0.5332],
                    ).createShader(Offset.zero & bounds.size),
                    child: SizedBox(
                      width: 218.w,
                      child: Text(
                        item.name,
                        style: TextStyle(
                          fontFamily: AppConstant.appFontFamily,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                          letterSpacing: 18 * -0.05,
                          color: Colors.white,
                        ),
                        maxLines: 5,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                ),
                ItemDescriptionComponent(itemDescription: item.description),
                Padding(
                  padding:  EdgeInsets.only(left: 20.w,bottom: 9.h,top: 14.h),
                  child:
                  SizedBox(
                    width: 50.w,
                    height: 14.h,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        'Preparation',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: AppConstant.appFontFamily,
                          fontWeight: FontWeight.w700,
                          fontSize: 10.sp,
                          height: 1,
                          letterSpacing: 10 * -0.05,
                          color: Color.fromRGBO(255, 255, 255, 0.7),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w,),
                  child: SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      spacing: 4.w,
                      runSpacing: 5.h,
                      children: item.preparation.map((prep) {
                        return UnconstrainedBox(
                            alignment: Alignment.centerLeft,
                            child: buildPreparationsBadge('${prep.label}: ${prep.value}'));
                      }).toList(),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 90.h,
        padding: EdgeInsets.only(bottom: 29.h),
        color: AppColors.appBackGroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 19.w,),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(228, 182, 121, 1),
                        Color.fromRGBO(254, 229, 196, 1),
                      ],
                      stops: [0.0025, 0.5332],
                    ).createShader(Offset.zero & bounds.size),
                    child: Text(
                      '${item.price} JD',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: AppConstant.appFontFamily,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        height: 0.98,
                        letterSpacing: 15 * -0.05,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  Text(
                    '+ tax & services',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: AppConstant.appFontFamily,
                      fontWeight: FontWeight.w700,
                      fontSize: 10.sp,
                      height: 1,
                      letterSpacing: 10 * -0.05,
                      color: Color.fromRGBO(121, 123, 116, 1),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Fluttertoast.showToast(msg: "Added to cart Successfully",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black,
                    textColor: Color.fromRGBO(228, 182, 121, 1),
                    fontSize: 16.0);
              },
              child: Padding(
                padding:  EdgeInsets.only(right: 4.w),
                child: Container(

                    width: 120.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23.r),
                      border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.3), width: 1),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color.fromRGBO(228, 182, 121, 1),
                          Color.fromRGBO(254, 229, 196, 1),
                        ],
                        stops: [0.0025, 0.5332],
                      )
                    ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(23.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 14.w),
                          child: Text(
                            'Add To Order',
                            style: TextStyle(
                              fontFamily: AppConstant.appFontFamily,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 10 * -0.05,
                              height: 0.98,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin:EdgeInsets.only(right: 6.w),
                          width: 36.w,
                          height: 36.h,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.2),
                            borderRadius: BorderRadius.circular(18.r),
                            border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.1),width: 1),
                          ),
                          child: Icon(Icons.arrow_forward_ios_rounded, size: 12.sp, color: Color.fromRGBO(0, 0, 0, 1)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
