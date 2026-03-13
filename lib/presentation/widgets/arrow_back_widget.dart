import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildArrowBackWidget(){
  return Padding(
    padding: EdgeInsets.only(left: 10.w),
    child: Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: 48.h,
        width: 48.w,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4.w, sigmaY: 4.w),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 0, 0, 0.4),
                shape: BoxShape.circle,
                border: Border.all(
                  style: BorderStyle.solid,
                  color: const Color.fromRGBO(0, 0, 0, 0.3),
                  width: 1.w,
                ),
              ),
              child: Center(
                child: SizedBox(
                  width: 18.38.w,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child:Icon(Icons.arrow_back_rounded,size: 18.38.w,color: Color.fromRGBO(255, 255, 255, 1),)
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}