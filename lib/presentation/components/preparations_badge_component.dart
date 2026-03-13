import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_constant.dart';

Widget buildPreparationsBadge(String text) {
  return Container(
    height: 38.h,
    constraints: BoxConstraints(
      minWidth: 68.w
    ),
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(255, 255, 255, 0.3),
      borderRadius: BorderRadius.circular(6.r),
      border: Border.all(
        color: const Color.fromRGBO(255, 255, 255, 0.18),
        width: 1,
      ),
    ),
    child: Text(
      text,
      maxLines: 1,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: AppConstant.appFontFamily,
        fontSize: 10.sp,
        fontWeight: FontWeight.w700,
        height: 1.0,
        letterSpacing: 10 * -0.05,
        color: Colors.white,
      ),
    ),
  );
}