import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recast_designs_assessment/core/utils/app_constant.dart';
import 'package:recast_designs_assessment/core/utils/enums.dart';
import 'package:recast_designs_assessment/presentation/components/food_item_shimmer_component.dart';
import 'package:recast_designs_assessment/presentation/controller/food_bloc.dart';
import 'package:recast_designs_assessment/presentation/controller/food_events.dart';
import 'package:recast_designs_assessment/presentation/controller/food_states.dart';

import '../../core/navigation/navigations_functions.dart';
import '../widgets/arrow_back_widget.dart';
import '../components/food_item_card_component.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

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
            leading: buildArrowBackWidget(),
            leadingWidth: 48.w,
            actions: [
             CircleAvatar(
               backgroundColor: Colors.transparent,
               radius: 35.r,
               child: Image.asset(AppConstant.profileImagePath,),
             )
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    AppConstant.appBarImagePath,
                    fit: BoxFit.cover,
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
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child:
                  SizedBox(
                    width: 28.w,
                    height: 14.h,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        'Lorem',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: AppConstant.appFontFamily,
                          fontWeight: FontWeight.w700,
                          fontSize: 10.sp,
                          height: 1,
                          letterSpacing: 10 * -0.05,
                          color: Color.fromRGBO(255, 255, 255, 0.8),
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
                      height: 26.h,
                      child: Text(
                        "CEANO",
                        style: TextStyle(
                          fontFamily: AppConstant.appFontFamily,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                          letterSpacing: 22 * -0.05,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 15.w,top: 4.h,right: 13.w),
                  child:
                  SizedBox(
                    width: 236.w,
                    child: Text(
                    AppConstant.appDescription,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: AppConstant.appFontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp,
                        height: 1.0,
                        letterSpacing: 10 * -0.05,
                        color: Color.fromRGBO(255, 255, 255, 0.7),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 16.w,bottom: 15.h,top: 15.h),
                  child:
                  SizedBox(
                    width: 54.w,
                    height: 15.h,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        'Atmosphere',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: AppConstant.appFontFamily,
                          fontWeight: FontWeight.w700,
                          fontSize: 11.sp,
                          height: 1,
                          letterSpacing: 11 * -0.05,
                          color: Color.fromRGBO(255, 255, 255, 0.81),
                        ),
                      ),
                    ),
                  ),
                ),
                BlocBuilder<FoodBloc,FoodState>(
                  buildWhen:(previous, current) => previous.loadAtmosphereImagesState!=current.loadAtmosphereImagesState ,
                  builder: (context, state) {
                    return SizedBox(
                      height: 239.h,
                      child: PageView.builder(
                        itemCount: state.listOfAtmosphereImages.length,
                        controller: PageController(viewportFraction: 0.91),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:  EdgeInsets.only(right: 9.w),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: Image.asset(
                                state.listOfAtmosphereImages[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 16.w,bottom: 9.h,top: 16.h),
                  child:
                  SizedBox(
                    width: 54.w,
                    height: 15.h,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        'Food Menu',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: AppConstant.appFontFamily,
                          fontWeight: FontWeight.w700,
                          fontSize: 11.sp,
                          height: 1,
                          letterSpacing: 11 * -0.05,
                          color: Color.fromRGBO(255, 255, 255, 0.81),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<FoodBloc,FoodState>(
            buildWhen: (previous, current) =>previous.loadFoodMenuItemsState!=current.loadFoodMenuItemsState ,
            builder: (context, state) {
              if(state.loadFoodMenuItemsState==LoadFoodMenuItemsState.loading){
                return SliverPadding(
                  padding:  EdgeInsets.only(left: 8.w,right: 10.w,bottom: 23.h),
                  sliver: SliverMasonryGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 7.h,
                    crossAxisSpacing: 7.w,
                    childCount: 6,
                    itemBuilder: (context, index) =>const FoodItemShimmerComponent(),
                  ),
                );
              }
              if(state.loadFoodMenuItemsState==LoadFoodMenuItemsState.error){
                return SliverToBoxAdapter(
                  child: Center(
                    child: Column(
                      children: [
                        Text(state.loadFoodMenuItemsErrorMessage,
                        style: TextStyle(color: Colors.white),),
                        TextButton(onPressed: ()=>context.read<FoodBloc>().add(GetFoodMenuItemsEvent()),
                            child: const Text("Try Again",style: TextStyle(color: Color(0xFFE4B679)),))
                      ],
                    ),
                  ),
                );
              }
              return SliverPadding(
                padding:  EdgeInsets.only(left: 8.w,right: 10.w,bottom: 23.h),
                sliver: SliverMasonryGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 7.h,
                  crossAxisSpacing: 7.w,
                  childCount: state.listOfFoodMenu.length,
                  itemBuilder: (context, index) {
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(9.r),
                        onTap: ()=>navigateToItemDetails(context, state.listOfFoodMenu[index] ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 94.h,
                          ),
                          child: FoodItemCardComponent(
                            item: state.listOfFoodMenu[index] ,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}
