import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Core/Constant/Colors.dart';
import '../../Core/Constant/textstyle.dart';


class Tabbutton extends StatelessWidget {
  final myselectedpage;
  final int? pagenumber;
  final String? text;
  final Function()? onPressed;

  Tabbutton({this.text, this.myselectedpage, this.pagenumber, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: 120.w,
        padding: EdgeInsets.symmetric(vertical: 18.sp),
        decoration: BoxDecoration(
           // boxShadow: kElevationToShadow[0],
            color: myselectedpage == pagenumber ? Colors.white :primaryColor,
           // borderRadius: BorderRadius.circular(50.r),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r)),
           //  border: Border.all(
           //      color: myselectedpage == pagenumber ? primaryColor : primaryColor, width: 1.5)
    ),
        //height: 41.h,
        child: Padding(
          padding: EdgeInsets.all(1.0.sp),
          child: Text(
            text ?? "no text",
            style: tabButtonstyle.copyWith(
              color: myselectedpage == pagenumber ? primaryColor: Colors.white ,
           ),
          ),
        ),
      ),
    );
  }
}
