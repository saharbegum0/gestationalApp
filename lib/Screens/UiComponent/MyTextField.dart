import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestationalage/Core/Constant/Colors.dart';

import '../../Core/Constant/textstyle.dart';

class MyTextField extends StatelessWidget {
  MyTextField(
      {required this.size,
      required this.textcontroller,
      required this.border,
      this.text,
      this.validator,
      this.keyboardType,
      this.onChange,
      this.mxLenth,this.icon});
  final int? mxLenth;
  final onChange;
  final String? text;
  final Size size;
  final keyboardType;
  final TextEditingController textcontroller;
  final OutlineInputBorder border;
  final validator;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.95,
      child: Theme(
        data: new ThemeData(
          primaryColor: Colors.redAccent,
          primaryColorDark: Colors.red,
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green),
        ),
        child: TextFormField(
          scrollPadding: EdgeInsets.only(bottom:80.sp),
          style: loginTextStyle2.copyWith(color: Colors.black, fontSize: 22.sp),
          maxLength: mxLenth,
          onChanged: onChange,
          validator: validator,
          keyboardType: keyboardType,
          controller: textcontroller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(color: Colors.grey, width: 1.0.w),
            ),
            hintStyle:
                loginTextStyle2.copyWith(color: Colors.black54, fontSize: 20.sp),
            hintText: text,
            label:const Text("add date"),
            contentPadding:
                EdgeInsets.symmetric(vertical: 20.0.sp, horizontal: 20.0.sp),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: primaryColor, width: 1.w)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: primaryColor, width: 1.w)),
            suffixIcon: Icon(icon),
            suffixIconColor: primaryColor
          ),

        ),
      ),
    );
  }
}