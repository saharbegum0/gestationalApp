import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Core/Colors.dart';


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
        width: 175.w,
        //height: 41.h,
        child: Padding(
          padding: EdgeInsets.all(1.0.sp),
          child: Text(
            text ?? "no text",
            // style: tabButtonstyle.copyWith(
            //   copyWithlor: myselectedpage == pagenumber ? Colors.white : blue,
         //   ),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 13.sp),
        decoration: BoxDecoration(
            boxShadow: kElevationToShadow[2],
            color: myselectedpage == pagenumber ? blue : Colors.white,
            borderRadius: BorderRadius.circular(50.r),
            border: Border.all(
                color: myselectedpage == pagenumber ? blue : blue, width: 1.5)),
      ),
    );
  }
}
