import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_constant.dart';

class ItemDescriptionComponent extends StatefulWidget {
  final String itemDescription;
  const ItemDescriptionComponent({super.key, required this.itemDescription});

  @override
  State<ItemDescriptionComponent> createState() {
    return _ItemDescriptionComponentState();
  }

  
}

class _ItemDescriptionComponentState extends State<ItemDescriptionComponent> {
  bool isExpanded=false;
  bool showSeeMore=false;
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)=>_checkShowSeeMore());
  }
  void _checkShowSeeMore() {
    final textPainter=TextPainter(
      text: TextSpan(
        text: widget.itemDescription,
          style: TextStyle(
            fontFamily: AppConstant.appFontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 11.sp,
            height: 1.0,
            letterSpacing: 11 * -0.05,
            color: Color.fromRGBO(255, 255, 255, 1.0),
          )
      ),
      maxLines: 3,
      textDirection: TextDirection.ltr
    )..layout(maxWidth: 236.w);
    if(textPainter.didExceedMaxLines){
      setState(() {
        showSeeMore=true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 15.w,top: 6.h,right: 13.w),
      child:
      SizedBox(
        width: 236.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: Text(
                  widget.itemDescription,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: AppConstant.appFontFamily,
                    fontWeight: FontWeight.w500,
                    fontSize: 11.sp,
                    height: 1.0,
                    letterSpacing: 11 * -0.05,
                    color: Color.fromRGBO(255, 255, 255, 1.0),

                  ),
                  maxLines: isExpanded ? null : 3,
                  overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                  softWrap: true
              ),
            ),
            if(showSeeMore)
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Text(
                  isExpanded ? "Show Less" : "Read More",
                  style: TextStyle(
                    fontFamily: AppConstant.appFontFamily,
                    fontWeight: FontWeight.w700,
                    fontSize: 10.sp,
                    color: const Color(0xFFE4B679),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



