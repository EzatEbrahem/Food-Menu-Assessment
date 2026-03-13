import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildGlassBadgeWidget({required String content, required double contentSize,
  required double contentWidth, required double contentHeight,required double widthBadge,
  required double heightBadge, required double radiusBadge,required BoxShape badgeBoxShape }){
  return ClipRRect(
    borderRadius: BorderRadius.circular(radiusBadge.r),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.w, sigmaY: 2.w),
      child: Container(
        height: heightBadge.w,
        width: widthBadge.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: badgeBoxShape == BoxShape.rectangle
              ? BorderRadius.circular(radiusBadge.r)
              : null,
          color: const Color.fromRGBO(0, 0, 0, 0.4),
          shape: badgeBoxShape,
          border: Border.all(
            style: BorderStyle.solid,
            color: const Color.fromRGBO(255, 255, 255, 0.25),
            width: 0.5.w,
          ),
        ),
        child: Center(
          child: SizedBox(
            width: contentWidth.w,
            height: contentHeight.h,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                content,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w500,
                  fontSize: contentSize.sp,
                  height: 0.98,
                  letterSpacing: contentSize * -0.05,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}